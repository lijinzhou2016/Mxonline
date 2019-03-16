# coding: utf-8


import xadmin
from .models import CityDict, CourseOrg, Teacher


class CityDictAdmin(object):
    list_display = ("name", "desc")
    search_fields = ("name", "desc")
    list_filter = ("create_time", "update_time")


class CourseOrgAdmin(object):
    list_display = ("name", "city", "desc")
    search_fields = ("name", "desc", "address", "image")
    list_filter = ("click_nums", "fav_nums", "create_time", "update_time")

    # 外键课搜索
    relfield_style = 'fk-ajax'


class TeacherAdmin(object):
    list_display = ("name", "work_company", "work_position", "points")
    search_fields = ("name", "work_company", "work_position", "points")
    list_filter = ("work_years", "click_nums", "fav_nums", "create_time", "update_time")


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)