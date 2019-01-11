#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Time    : 2019/1/10 10:45 PM
# @Author  : LiJinzhou
# @File    : forms.py

from django import forms
from captcha.fields import CaptchaField


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={"invalid": "神奇的验证码啊"})
