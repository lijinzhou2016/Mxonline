# coding: utf-8
from __future__ import unicode_literals

from django.db import models


class Course(models.Model):
    name = models.CharField(max_length=100, verbose_name="课程名")
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    detail = models.TextField(verbose_name="课程详情")
    degree = models.CharField(choices=(("cj", "初级"), ("zj", "中级"), ("gj", "高级")), verbose_name="难度", max_length=2)
    learn_times = models.IntegerField(verbose_name="学习时长", default=0)
    students = models.IntegerField(verbose_name="学习人数", default=0)
    fav_nums = models.IntegerField(verbose_name="收藏人数", default=0)
    image = models.ImageField(verbose_name="封面", upload_to="courses/%Y/%m")
    click_nums = models.IntegerField(verbose_name="点击数", default=0)
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "课程"
        verbose_name_plural = verbose_name

