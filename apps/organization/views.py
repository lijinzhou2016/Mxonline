# coding: utf-8
from django.db.models import Q
from django.views.generic.base import View
import json
from django.http import HttpResponse
from django.shortcuts import render
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from courses.models import Course
from .forms import UserAskForm
from .models import CourseOrg, CityDict, Teacher
from operation.models import UserFavorite


class OrgView(View):
    """
    课程机构列表功能
    """
    def get(self, request):
        all_orgs = CourseOrg.objects.all()
        all_cities = CityDict.objects.all()
        hot_orgs = all_orgs.order_by("-click_nums")[:3]

        # 机构搜索
        search_keywords = request.GET.get("keywords", "")
        print(search_keywords)
        if search_keywords:
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords) |
                                             Q(desc__icontains=search_keywords))

        # 城市筛选，在数据库中外键city保存成city_id
        city_id = request.GET.get("city", "")
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 类别筛选
        category = request.GET.get("ct", "")
        if category:
            all_orgs = all_orgs.filter(category=category)

        # 排序
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "students":
                all_orgs.order_by("-students")
            elif sort == "course_nums":
                all_orgs.order_by("-course_nums")

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        paginator = Paginator(all_orgs, 5, request=request)
        page_datas = paginator.page(page)

        return render(request, 'org-list.html', {
            "all_cities": all_cities,
            "page_datas": page_datas,
            "city_id": city_id,
            "category": category,
            "hot_orgs": hot_orgs,
            "sort": sort,
        })


class AddUserAskView(View):
    """
    用户添加咨询
    """
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            userask_form.save(commit=True)
            return HttpResponse(json.dumps({'status': 'success'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '添加出错'}), content_type="application/json")


class OrgHomeView(View):
    """
    机构首页
    """
    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums += 1
        course_org.save()
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        current_page = "home"
        return render(request, 'org-detail-homepage.html', {
            "course_org": course_org,
            "all_courses": all_courses,
            "all_teachers": all_teachers,
            "has_fav": has_fav,
            "current_page": current_page
        })


class OrgCourseView(View):
    """
    机构课程页面
    """
    def get(self, request, org_id):
        current_page = "course"
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        return render(request, 'org-detail-course.html', {
            "course_org": course_org,
            "all_courses": all_courses,
            "current_page": current_page,
            "has_fav": has_fav
        })


class OrgDescView(View):
    """
    机构描述页面
    """
    def get(self, request, org_id):
        current_page = "desc"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html', {
            "course_org": course_org,
            "current_page": current_page,
            "has_fav": has_fav
        })


class OrgTeacherView(View):
    """
    机构讲师页面
    """
    def get(self, request, org_id):
        current_page = "teacher"
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        return render(request, 'org-detail-teachers.html', {
            "course_org": course_org,
            "all_teachers": all_teachers,
            "current_page": current_page,
            "has_fav": has_fav
        })


class AddFavView(View):
    """
    用户 收藏/取消收藏
    """
    def post(self, request):
        fav_id = request.POST.get('fav_id', '')
        fav_type = request.POST.get('fav_type', '')

        # 判断用户是否登录
        if not request.user.is_authenticated:
            fail = {'status': 'fail', 'msg': '用户未登录'}
            return HttpResponse(json.dumps(fail), content_type="application/json")

        # 参数检测
        if (not fav_id) or (not fav_type):
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '参数错误'}), content_type="application/json")

        # 查询是否收藏，若收藏则取消收藏
        exist_record = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_record:
            if int(fav_type) == 1:
                course = Course.objects.get(id=fav_id)
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=fav_id)
                course_org.fav_nums -= 1
                if course_org.fav_nums < 0:
                    course_org.fav_nums = 0
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=fav_id)
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            exist_record.delete()
            return HttpResponse(json.dumps({'status': 'success', 'msg': '收藏'}), content_type="application/json")
        else:
            if int(fav_type) == 1:
                course = Course.objects.get(id=fav_id)
                course.fav_nums += 1
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=fav_id)
                course_org.fav_nums += 1
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=fav_id)
                teacher.fav_nums += 1
                teacher.save()
            user_fav = UserFavorite()
            user_fav.user = request.user
            user_fav.fav_id = int(fav_id)
            user_fav.fav_type = int(fav_type)
            user_fav.save()
            return HttpResponse(json.dumps({'status': 'success', 'msg': '已收藏'}), content_type="application/json")


class TeacherListView(View):
    """
    讲师列表页
    """
    def get(self, request):
        all_teachers = Teacher.objects.all()

        # 排序
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "hot":
                all_teachers.order_by("-click_nums")

        sort_teachers = all_teachers[:3]

        # 教师搜索
        search_keywords = request.GET.get("keywords", "")
        print(search_keywords)
        if search_keywords:
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords) |
                                               Q(work_company__icontains=search_keywords) |
                                               Q(work_position__icontains=search_keywords))

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        paginator = Paginator(all_teachers, 1, request=request)
        page_datas = paginator.page(page)

        return render(request, 'teachers-list.html', {
            "sort": sort,
            "page_datas": page_datas,
            "sort_teachers": sort_teachers,
        })


class TeacherDetailView(View):
    """
    讲师详情页
    """
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=teacher_id)
        teacher.click_nums += 1
        teacher.save()
        courses = Course.objects.filter(teacher=teacher)

        sort_teachers = Teacher.objects.all().order_by("-click_nums")[:3]

        has_teacher_fav = False
        try:
            if UserFavorite.objects.filter(user=request.user, fav_type=3, fav_id=teacher_id):
                has_teacher_fav = True
        except Exception as e:
            pass
        has_org_fav = False
        try:
            if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher.org.id):
                has_org_fav = True
        except Exception as e:
            pass

        return render(request, 'teacher-detail.html', {
            "teacher": teacher,
            "courses": courses,
            "sort_teachers": sort_teachers,
            "has_teacher_fav": has_teacher_fav,
            "has_org_fav": has_org_fav
        })
