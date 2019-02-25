# coding: utf-8


import xadmin
from .models import Course, Lesson, Video, CourseResource, BannerCourse


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ("name", "desc", "students", "fav_nums", "degree", "click_nums", 'get_zj_nums', 'go_to')
    search_fields = ("name", "desc", "detail", "image")
    list_filter = ("students", "fav_nums", "degree", "click_nums", "create_time", "update_time")

    # # 定时刷新
    # refresh_times = (3, 5)

    # 在列表页可以直接编辑的字段
    list_editable = ('desc', 'degree')

    # 嵌入外键的model
    inlines = (LessonInline, CourseResourceInline)

    # 过滤数据
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    # 保存课程的时候，该课程机构的课程数加一
    def save_model(self):
        obj = self.new_obj
        obj.save()
        if obj.course_org:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter()


class BannerCourseAdmin(object):
    list_display = ("name", "desc", "students", "fav_nums", "degree", "click_nums")
    search_fields = ("name", "desc", "detail", "image")
    list_filter = ("students", "fav_nums", "degree", "click_nums", "create_time", "update_time")
    # 在列表页可以直接编辑的字段
    list_editable = ('desc', 'degree')

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class LessonAdmin(object):
    list_display = ("course", "name", "create_time")
    search_fields = ("course__name", "name")
    list_filter = ("course__name", "create_time", "update_time")


class VideoAdmin(object):
    list_display = ("lesson", "name", "create_time")
    search_fields = ("lesson__name", "name")
    list_filter = ("lesson__name", "create_time", "update_time")


class CourseResourceAdmin(object):
    list_display = ("course", "name", "download", "create_time")
    search_fields = ("course__name", "name", "download")
    list_filter = ("course__name", "create_time", "update_time")


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
