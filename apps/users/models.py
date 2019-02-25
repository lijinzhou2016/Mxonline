# coding: utf-8
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser


# 自定义user，覆盖系统自带的user表
class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=50, verbose_name="昵称", default="")
    birthday = models.DateField(verbose_name="生日", null=True, blank=True)
    gender = models.CharField(choices=(("male", "男"), ("female", "女")), default="male", max_length=6, verbose_name="性别")
    address = models.CharField(max_length=100, default="", verbose_name="地址")
    mobile = models.CharField(max_length=11, null=True, blank=True, verbose_name="手机")
    image = models.ImageField(upload_to="image/%Y/%m", default="image/default.png", max_length=100, verbose_name="头像")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    def unreader_message_counts(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id, has_read=False).count()

    def __unicode__(self):
        return self.nick_name


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name="验证码")
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    send_type = models.CharField(max_length=20, verbose_name="验证码类型",
                                 choices=(("register", "注册"), ("forget", "找回密码"), ("update_email", "修改邮箱")))
    send_time = models.DateTimeField(auto_now_add=True, verbose_name="发送时间")

    class Meta:
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.code


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name="标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name="轮播图")
    url = models.URLField(max_length=200, verbose_name="访问地址")
    index = models.IntegerField(default=100, verbose_name="顺序")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.title
