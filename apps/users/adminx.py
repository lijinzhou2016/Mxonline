#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Time    : 2019/1/10 12:08 AM
# @Author  : LiJinzhou
# @File    : adminx.py


import xadmin
from .models import EmailVerifyRecord, Banner


class EmailVerifyRecordAdmin(object):
    list_display = ("code", "email", "send_type", "send_time")
    search_fields = ("code", "email")
    list_filter = ("send_type", "send_time")


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)