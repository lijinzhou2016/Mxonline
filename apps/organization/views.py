# coding: utf-8

from django.views.generic.base import View
import json
from django.http import HttpResponse
from django.shortcuts import render
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .forms import UserAskForm
from .models import CourseOrg, CityDict


class OrgView(View):
    """
    课程机构列表功能
    """
    def get(self, request):
        all_orgs = CourseOrg.objects.all()
        all_cities = CityDict.objects.all()
        hot_orgs = all_orgs.order_by("-click_nums")[:3]

        # 城市筛选，在数据库中外键city保存成city_id
        city_id = request.GET.get("city", "")
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 类别筛选
        category = request.GET.get("ct", "")
        if category:
            all_orgs = all_orgs.filter(category=category)

        # 排序
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "students":
                all_orgs.order_by("-students")
            elif sort == "course_nums":
                all_orgs.order_by("-course_nums")

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        paginator = Paginator(all_orgs, 5, request=request)
        orgs = paginator.page(page)

        return render(request, 'org-list.html', {
            "all_cities": all_cities,
            "all_orgs": orgs,
            "city_id": city_id,
            "category": category,
            "hot_orgs": hot_orgs,
            "sort": sort
        })


class AddUserAskView(View):
    """
    用户添加咨询
    """
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        success = {'status': 'success'}
        fail = {'status': 'fail', 'msg': '添加出错'}
        if userask_form.is_valid():
            userask_form.save(commit=True)
            return HttpResponse(json.dumps(success), content_type="application/json")
        else:
            return HttpResponse(json.dumps(fail), content_type="application/json")
