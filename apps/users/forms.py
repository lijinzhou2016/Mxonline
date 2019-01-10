#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Time    : 2019/1/10 10:45 PM
# @Author  : LiJinzhou
# @File    : forms.py

from django import forms


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)
