# coding: utf-8


import xadmin
from .models import CityDict, CourseOrg, Teacher


class CityDictAdmin(object):
    list_display = ("id", "name", "desc", "create_time", "update_time")
    search_fields = ("name", "desc")
    list_filter = ("id", "create_time", "update_time")


class CourseOrgAdmin(object):
    list_display = ("id", "name", "desc", "address", "create_time", "update_time")
    search_fields = ("name", "desc", "address", "image")
    list_filter = ("id", "click_nums", "fav_nums", "create_time", "update_time")


class TeacherAdmin(object):
    list_display = ("id", "name", "work_company", "work_position", "points", "update_time")
    search_fields = ("name", "work_company", "work_position", "points")
    list_filter = ("id", "work_years", "click_nums", "fav_nums", "create_time", "update_time")


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)