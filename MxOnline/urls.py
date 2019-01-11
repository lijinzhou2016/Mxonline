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
from users.views import LoginView, RegisterView, ActiveUserView

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),

    # xadmin, 支持image字段显示的url配置
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # 处理静态文件
    url('^$', TemplateView.as_view(template_name="index.html"), name="index"),
    # url('^login/$', TemplateView.as_view(template_name="login.html"), name="login")
    # 基于函数的处理方式
    # url('^login/$', mylogin, name="login")

    url("^login/$", LoginView.as_view(), name="login"),
    url("^register/$", RegisterView.as_view(), name="register"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="active")
]
