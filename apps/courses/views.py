# coding: utf-8
import json

from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic.base import View
from .models import Course, CourseResource, Video
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixins import LoginRequiredMixin


class CourseListView(View):
    def get(self, request):
        all_courses = Course.objects.all().order_by("-create_time")
        hot_courses = all_courses.order_by("-click_nums")[:3]

        # 课程搜索
        search_keywords = request.GET.get("keywords", "")
        if search_keywords:
            all_courses = all_courses.filter(Q(name__icontains=search_keywords)|
                                             Q(desc__icontains=search_keywords)|
                                             Q(detail__icontains=search_keywords))

        # 排序
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "students":
                all_courses = all_courses.order_by("-students")
            elif sort == "hot":
                all_courses = all_courses.order_by("-click_nums")

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        paginator = Paginator(all_courses, 2, request=request)
        page_datas = paginator.page(page)
        return render(request, 'course-list.html', {
            "page_datas": page_datas,
            "sort": sort,
            "hot_courses": hot_courses,
        })


class CourseDetailView(View):
    """
    课程详情页
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()

        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:2]
        else:
            relate_courses =[]

        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_id), fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True

        return render(request, 'course-detail.html', {
            "course": course,
            "relate_courses": relate_courses,
            "has_fav_course": has_fav_course,
            "has_fav_org": has_fav_org,
        })


class CourseInfoView(LoginRequiredMixin, View):
    """
    课程章节信息
    """

    def get(self, request, course_id):
        # 课程实例
        course = Course.objects.get(id=int(course_id))
        course.students += 1
        course.save()

        # 查询用户是否已经关联了本课程
        user_course = UserCourse.objects.filter(user=request.user, course=course)
        if not user_course:
            UserCourse(user=request.user, course=course).save()

        # 筛选出该course的所有资源
        all_resources = CourseResource.objects.filter(course=course)
        # 筛选出包含该course的所有UserCourse记录
        user_courses = UserCourse.objects.filter(course=course)
        # 取出UserCourse中的user id字段组成列表（所有学习过该课程的用户id列表）
        user_ids = [user_course.user.id for user_course in user_courses]
        # 包含user_ids这些用户的UserCourse记录
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出所有课程id
        course_ids = [ user_course.course.id for user_course in all_user_courses]
        # 取出学过该课程的用户学过的其他所有课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
        return render(request, 'course-video.html', {
            "course": course,
            "all_resources": all_resources,
            "relate_courses": relate_courses
        })


class CommentsView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        all_commonts = CourseComments.objects.filter(course=course)
        return render(request, 'course-comment.html', {
            "course": course,
            "all_resources": all_resources,
            "all_commonts": all_commonts,
        })


class AddCommentsView(View):
    def post(self, request):
        # 判断用户是否登录
        if not request.user.is_authenticated:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '用户未登录'}), content_type="application/json")

        course_id = int(request.POST.get("course_id", 0))
        comments = request.POST.get("comments", "")
        if course_id > 0 and comments:
            course_comment = CourseComments()
            course = Course.objects.get(id=course_id)
            course_comment.course = course
            course_comment.comments = comments
            course_comment.user = request.user
            course_comment.save()
            return HttpResponse(json.dumps({'status': 'success', 'msg': '添加成功'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '添加失败'}), content_type="application/json")


class VideoPlayView(View):
    """
    视频播放页面
    """
    def get(self, request, video_id):
        # 课程实例
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course

        # 查询用户是否已经关联了本课程
        user_course = UserCourse.objects.filter(user=request.user, course=course)
        if not user_course:
            UserCourse(user=request.user, course=course).save()

        # 筛选出该course的所有资源
        all_resources = CourseResource.objects.filter(course=course)
        # 筛选出包含该course的所有UserCourse记录
        user_courses = UserCourse.objects.filter(course=course)
        # 取出UserCourse中的user id字段组成列表（所有学习过该课程的用户id列表）
        user_ids = [user_course.user.id for user_course in user_courses]
        # 包含user_ids这些用户的UserCourse记录
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出所有课程id
        course_ids = [ user_course.course.id for user_course in all_user_courses]
        # 取出学过该课程的用户学过的其他所有课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
        return render(request, 'course-play.html', {
            "course": course,
            "all_resources": all_resources,
            "relate_courses": relate_courses,
            "video": video
        })