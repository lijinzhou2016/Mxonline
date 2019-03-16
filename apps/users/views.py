# coding: utf-8
import json

from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from pure_pagination import Paginator, PageNotAnInteger
from django.urls import reverse

from courses.models import Course
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from utils.mixins import LoginRequiredMixin
from .models import UserProfile, EmailVerifyRecord, Banner
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm, UploadImageForm, UserInfoForm
from utils.email import send_register_email


class CustomBackend(ModelBackend):
    """
    自定义登录逻辑，支持用户名或邮箱登录
    """
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class ActiveUserView(View):
    """
    激活用户并返回登录页面
    """
    def get(self, request, active_code):
        email_records = EmailVerifyRecord.objects.filter(code=active_code)
        if email_records:
            for email_record in email_records:
                email = email_record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
            return render(request, 'login.html', {})
        else:
            return render(request, 'active_fail.html', {})


class ResetView(View):
    """
    返回密码重置页面
    """
    def get(self, request, reset_code):
        email_records = EmailVerifyRecord.objects.filter(code=reset_code)
        if email_records:
            for email_record in email_records:
                email = email_record.email
                return render(request, 'password_reset.html', {"email": email})
        else:
            return render(request, 'active_fail.html', {})


class ModifyPwdView(View):
    """
    验证用户修改的新密码，并返回登录页面
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            email = request.POST.get("email", "")
            if pwd1 != pwd2:
                return render(request, "password_reset.html", {"email": email, "msg": "两次密码不一致"})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            return render(request, "login.html")
        else:
            email = request.POST.get("email", "")
            return render(request, "password_reset.html", {"email": email, "modify_form": modify_form})


class RegisterView(View):
    """
    用户注册
    """
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {"register_form": register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            email = request.POST.get("email")
            password = request.POST.get("password")
            if UserProfile.objects.filter(email=email):
                return render(request, "register.html", {"register_form": register_form, "msg": "该邮箱已注册"})
            user = UserProfile()
            user.username = email
            user.email = email
            user.is_active = False
            user.password = make_password(password)
            user.save()
            send_register_email(email)

            # 生成欢迎新用户注册消息
            user_message = UserMessage()
            user_message.user = user.id
            user_message.message = "欢迎 {0} 注册暮雪在线网".format(user.username)
            user_message.save()

            return render(request, 'login.html', {"user": {"email": email, "password": password}, "msg": "请先登录邮箱进行验证"})
        else:
            return render(request, 'register.html', {"register_form": register_form})


class LogoutView(View):
    """
    用户退出
    """
    def get(self, request):
        logout(request)
        # 重定向到首页
        return HttpResponseRedirect(reverse('index'))


class LoginView(View):
    """
    用户登录
    """
    def get(self, request):
        return render(request, "login.html", {})

    def post(self, request):
        login_forms = LoginForm(request.POST)
        if login_forms.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if not user.is_active:
                    return render(request, "login.html", {"msg": "用户未激活"})
                login(request, user)
                # 重定向到首页
                return HttpResponseRedirect(reverse('index'))
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误"})
        else:
            return render(request, "login.html", {"login_forms": login_forms})


class ForgetPwdView(View):
    """
    忘记密码页面，发送重置密码链接到用户邮箱
    """
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, 'forgetpwd.html', {"forget_form": forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email", "")
            send_register_email(email, 'forget')
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {"forget_form": forget_form})


class UserInfoView(LoginRequiredMixin, View):
    """
    用户个人信息
    """
    def get(self, request):
        return render(request, 'usercenter-info.html')

    def post(self, request):
        # instance=request.user,若不传入这个实例，会新增一个实例保存
        userinfo_form = UserInfoForm(request.POST, instance=request.user)
        if userinfo_form.is_valid():
            userinfo_form.save(commit=True)
            return HttpResponse(json.dumps({'status': 'success'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '保存存错'}), content_type="application/json")



# 函数的方式处理响应
def mylogin(request):
    if request.method == "POST":
        user_name = request.POST.get("username", "")
        pass_word = request.POST.get("password", "")
        user = authenticate(username=user_name, password=pass_word)
        if user is not None:
            if user.is_active:
                login(request, user)
                return render(request, 'index.html', {})
            else:
                return render(request, "login.html", {"msg": "该用户未激活"})
        else:
            return render(request, "login.html", {"msg": "用户名或密码错误"})
    elif request.method == "GET":
        return render(request, "login.html", {})


class UploadImageView(LoginRequiredMixin, View):
    """
    用户修改头像
    """
    def post(self, request):
        # 文件类型字段，需要传入request.FILES
        '''第一种保存iamge方法'''
        # image_form = UploadImageForm(request.POST, request.FILES)
        # if image_form.is_valid():
        #     request.user.image = image_form.cleaned_data.get("image")
        #     request.user.save()
        '''第二种保存image方法'''
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save(commit=True)
            return HttpResponse(json.dumps({'status': 'success'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '保存存错'}), content_type="application/json")


class UpdatePwdView(View):
    """
    用户中心修改密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse(json.dumps({'status': 'fail', 'msg': '密码不一致'}), content_type="application/json")
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return HttpResponse(json.dumps({'status': 'success'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type="application/json")


class SendEmailCodeView(LoginRequiredMixin, View):
    """
    发送邮箱验证码
    """
    def get(self, request):
        email = request.GET.get("email", "")
        if UserProfile.objects.filter(email=email):
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '邮箱已存在'}), content_type="application/json")
        send_register_email(email, 'update_email')
        return HttpResponse(json.dumps({'status': 'success'}), content_type="application/json")


class UpdateEmailView(LoginRequiredMixin, View):
    """
    用户中心修改绑定邮箱
    """

    def post(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")
        if not email or not code:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '参数错误'}), content_type="application/json")
        if EmailVerifyRecord.objects.filter(email=email, code=code, send_type="update_email"):
            user = request.user
            user.email = email
            user.save()
            return HttpResponse(json.dumps({'status': 'success'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '验证码错误'}), content_type="application/json")


class MyCourse(LoginRequiredMixin, View):
    """
    我的课程
    """
    def get(self, request):
        user_courses = UserCourse.objects.filter(user=request.user)
        courses = [course.course for course in user_courses]
        return render(request, 'usercenter-mycourse.html', {
            'courses': courses
        })


class MyFavOrg(LoginRequiredMixin, View):
    """
    我收藏的课程机构
    """
    def get(self, request):
        user_favs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        org_ids = [user_fav.fav_id for user_fav in user_favs]
        orgs = CourseOrg.objects.filter(id__in=org_ids)
        return render(request, 'usercenter-fav-org.html', {
            'orgs': orgs
        })


class MyFavCourse(LoginRequiredMixin, View):
    """
    我收藏的课程
    """
    def get(self, request):
        user_favs = UserFavorite.objects.filter(user=request.user, fav_type=1)
        course_ids = [user_fav.fav_id for user_fav in user_favs]
        courses = Course.objects.filter(id__in=course_ids)

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        paginator = Paginator(courses, 1, request=request)
        page_datas = paginator.page(page)

        return render(request, 'usercenter-fav-course.html', {
            'page_datas': page_datas
        })


class MyFavTeacher(LoginRequiredMixin, View):
    """
    我收藏的讲师
    """
    def get(self, request):
        user_favs = UserFavorite.objects.filter(user=request.user, fav_type=3)
        teacher_ids = [user_fav.fav_id for user_fav in user_favs]
        teachers = Teacher.objects.filter(id__in=teacher_ids)
        return render(request, 'usercenter-fav-teacher.html', {
            'teachers': teachers
        })


class MyMessageView(LoginRequiredMixin, View):
    """
    我的消息
    """
    def get(self, request):
        all_messages = UserMessage.objects.filter(user=request.user.id)

        all_unread_messages = all_messages.filter(has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        paginator = Paginator(all_messages, 1, request=request)
        page_datas = paginator.page(page)

        return render(request, 'usercenter-message.html', {
            "page_datas": page_datas
        })


class IndexView(View):
    """
    首页
    """

    def get(self, request):
        all_banners = Banner.objects.all().order_by("index")
        courses = Course.objects.filter(is_banner=False)[:5]
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]
        return render(request, 'index.html', {
            "all_banners": all_banners,
            "courses": courses,
            "banner_courses": banner_courses,
            "course_orgs": course_orgs
        })


def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response
