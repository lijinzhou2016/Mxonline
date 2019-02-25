# coding: utf-8

from __future__ import unicode_literals

from django.db import models


class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name="城市")
    desc = models.CharField(max_length=200, verbose_name="描述")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "城市"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CourseOrg(models.Model):
    name = models.CharField(max_length=50, verbose_name="机构名称")
    category = models.CharField(max_length=20, default="pxjg", choices=(("gr", "个人"), ("gx", "高校"), ("pxjg", "培训机构")), verbose_name="机构类别")
    desc = models.CharField(max_length=200, verbose_name="机构描述")
    tag = models.CharField(max_length=10, verbose_name="机构标签", null=True, blank=True)
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏数")
    students = models.IntegerField(default=0, verbose_name="学生数")
    course_nums = models.IntegerField(default=0, verbose_name="课程数")
    image = models.ImageField(upload_to="org/%Y/%m", verbose_name="封面图")
    address = models.CharField(max_length=150, verbose_name="机构地址")
    city = models.ForeignKey(CityDict, verbose_name="所在城市")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "课程机构"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    def get_teacher_nums(self):
        return self.teacher_set.all().count()


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name="所属机构")
    name = models.CharField(max_length=50, verbose_name="教师名字")
    age = models.IntegerField(default=18, verbose_name="年龄")
    image = models.ImageField(verbose_name="头像", upload_to="teacher/%Y/%m", null=True, blank=True)
    work_years = models.IntegerField(default=0, verbose_name="工作年限")
    work_company = models.CharField(max_length=50, verbose_name="就职公司")
    work_position = models.CharField(max_length=50, verbose_name="公司职位")
    points = models.CharField(max_length=50, verbose_name="教学特点")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏数")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "教师"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name
