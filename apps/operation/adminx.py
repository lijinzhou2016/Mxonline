# coding: utf-8


import xadmin
from .models import UserFavorite, UserAsk, UserMessage, UserCourse, CourseComments


class UserAskAdmin(object):
    list_display = ("name", "mobile", "course_name", "create_time", "update_time")
    list_filter = ("create_time", "update_time")
    search_fields = ("name", "mobile", "course_name")


class CourseCommentsAdmin(object):
    list_display = ("user", "course", "comments")
    list_filter = ("create_time", "update_time")
    search_fields = ("user", "course", "comments")


class UserFavoriteAdmin(object):
    list_display = ("user", "fav_id", "fav_type", "create_time", "update_time")
    list_filter = ("fav_id", "fav_type", "create_time", "update_time")
    search_fields = ("user", "fav_id")


class UserMessageAdmin(object):
    list_display = ("user", "message", "has_read", "create_time", "update_time")
    list_filter = ("has_read", "create_time", "update_time")
    search_fields = ("message",)


class UserCourseAdmin(object):
    list_display = ("user", "course", "comments")
    list_filter = ("create_time", "update_time")
    search_fields = ("user", "course", "comments")


xadmin.site.register(UserAsk, UserAskAdmin)
xadmin.site.register(CourseComments, CourseCommentsAdmin)
xadmin.site.register(UserFavorite, UserFavoriteAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(UserCourse, UserCourseAdmin)