# coding: utf-8
from __future__ import unicode_literals

from django.db import models
from organization.models import CourseOrg, Teacher
from DjangoUeditor.models import UEditorField


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name="课程机构", null=True, blank=True)
    teacher = models.ForeignKey(Teacher, verbose_name="课程讲师", null=True, blank=True)
    name = models.CharField(max_length=100, verbose_name="课程名")
    is_banner = models.BooleanField(verbose_name="是否轮播", default=False)
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    detail = UEditorField(verbose_name="课程详情", width=600, height=300, imagePath="courses/ueditor/",
                          filePath="courses/ueditor/", default="")
    degree = models.CharField(choices=(("cj", "初级"), ("zj", "中级"), ("gj", "高级")), verbose_name="难度", max_length=2)
    learn_times = models.IntegerField(verbose_name="学习时长", default=0)
    students = models.IntegerField(verbose_name="学习人数", default=0)
    fav_nums = models.IntegerField(verbose_name="收藏人数", default=0)
    image = models.ImageField(verbose_name="封面", upload_to="courses/%Y/%m")
    click_nums = models.IntegerField(verbose_name="点击数", default=0)
    category = models.CharField(max_length=20, default="后端开发", verbose_name="课程类别")
    tag = models.CharField(default="", max_length=10, verbose_name="课程标签")
    you_need_know = models.CharField(max_length=300, null=True, blank=True, verbose_name="课程须知")
    teacher_tell = models.CharField(max_length=300, null=True, blank=True, verbose_name="老师告诉你")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "课程"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    def get_zj_nums(self):
        """获取课程章节数"""
        return self.lesson_set.all().count()
    # 显示在xadmin列表中的名称
    get_zj_nums.short_description = "章节数"

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='http://www.baidu.com'>跳转</a>")
        # 显示在xadmin列表中的名称
    go_to.short_description = "跳转"

    def get_course_lesson(self):
        """获取课程章节"""
        return self.lesson_set.all()

    def get_learn_users(self):
        return self.usercourse_set.all()[:5]


class BannerCourse(Course):
    class Meta:
        verbose_name = "轮播课程"
        verbose_name_plural = verbose_name
        proxy = True


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name="所属课程")
    name = models.CharField(max_length=100, verbose_name="章节名")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "章节"
        verbose_name_plural = verbose_name

    def get_lesson_video(self):
        return self.video_set.all()

    def __unicode__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name="所属章节")
    name = models.CharField(max_length=100, verbose_name="视频名")
    url = models.CharField(max_length=200, null=True, blank=True, verbose_name="视频地址")
    video_times = models.IntegerField(verbose_name="视频时长", default=0)
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "视频"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name="所属课程")
    name = models.CharField(max_length=100, verbose_name="资源名")
    download = models.FileField(upload_to="course/resource/%Y/%m", verbose_name="课程资源")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "资源"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name
