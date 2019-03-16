# coding: utf-8
"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.views.generic import TemplateView
from django.views.static import serve

from .settings import MEDIA_ROOT
import xadmin

from users.views import mylogin
from users.views import LoginView, RegisterView, ActiveUserView, ForgetPwdView, ResetView, ModifyPwdView
from users.views import LogoutView, IndexView
from organization.views import OrgView


urlpatterns = [
    # 富文本插件
    url(r'^ueditor/', include('DjangoUeditor.urls')),
    # 后台管理系统插件
    url(r'^xadmin/', xadmin.site.urls),

    # 静态资源url处理，（xadmin, 支持image字段显示的url配置）
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # url(r'^static/(?P<path>.*)$', serve, {"document_root": STATIC_ROOT}),

    # 处理静态文件
    # url('^$', TemplateView.as_view(template_name="index.html"), name="index"),
    # url('^login/$', TemplateView.as_view(template_name="login.html"), name="login")
    # 基于函数的处理方式
    # url('^login/$', mylogin, name="login")

    # 首页
    url("^$", IndexView.as_view(), name="index"),

    # 登录
    url("^login/$", LoginView.as_view(), name="login"),

    # 退出
    url("^logout/$", LogoutView.as_view(), name="logout"),

    # 注册
    url("^register/$", RegisterView.as_view(), name="register"),

    # 验证码相关url
    url(r'^captcha/', include('captcha.urls')),

    # 激活
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="active"),

    # 忘记密码
    url(r'^forget/$', ForgetPwdView.as_view(), name="forget"),

    # 重置密码链接
    url(r'^reset/(?P<reset_code>.*)/$', ResetView.as_view(), name="reset"),

    # 修改密码
    url(r'^modify/$', ModifyPwdView.as_view(), name="modify"),


    # 课程机构app相关url
    url(r'^org/', include(('organization.urls', 'organization'), namespace="org")),

    # 课程app相关url
    url(r'^course/', include(('courses.urls', 'courses'), namespace="course")),

    # user相关url
    url(r'^users/', include(('users.urls', 'users'), namespace="users")),
]

# 全局404
handler404 = 'users.views.page_not_found'

# 全局 500
handler500 = 'users.views.page_error'
