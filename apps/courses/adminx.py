# coding: utf-8


import xadmin
from .models import Course, Lesson, Video, CourseResource


class CourseAdmin(object):
    list_display = ("id", "name", "desc", "degree", "students", "fav_nums", "degree", "click_nums")
    search_fields = ("name", "desc", "detail", "image")
    list_filter = ("students", "fav_nums", "degree", "click_nums", "create_time", "update_time")


class LessonAdmin(object):
    list_display = ("id", "course", "name", "create_time")
    search_fields = ("course__name", "name")
    list_filter = ("course__name", "create_time", "update_time")


class VideoAdmin(object):
    list_display = ("id", "lesson", "name", "create_time")
    search_fields = ("lesson__name", "name")
    list_filter = ("lesson__name", "create_time", "update_time")


class CourseResourceAdmin(object):
    list_display = ("id", "course", "name", "download", "create_time")
    search_fields = ("course__name", "name", "download")
    list_filter = ("course__name", "create_time", "update_time")


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
