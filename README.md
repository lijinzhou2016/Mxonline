# MxOnline

# 项目描述

`前台功能模块`

* 基本模块: 
登录 / 注册 / 找回密码 / 全局搜索 / 个人中心
* 课程功能: 
课程管理 / 讲师管理 / 授课机构管理 / 热门推荐 / 相关课程推荐
* 用户操作管理: 
用户收藏 / 课程评论

`后台管理系统`

* 课程管理模块: 
课程管理 / 课程资源管理 / 课程评论管理
* 轮播课程管理:
认证和授权管理 / 用户管理 / 组管理 / 权限管理 / 用户日志管理
* 机构管理模块:
课程机构管理 / 讲轮播图管理

# branch master
```
python 3.6
django 2.0
mysql 5.7
```

# Quik Start


1 获取项目
```shell
$ git clone https://github.com/lijinzhou2016/MxOnline.git
$ cd Mxonline
$ pip install -r requirements.txt
$ python manage.py runserver
```

2 项目运行前，创建数据库表，并配置settings.py

```python
 DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mxonline',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST': '127.0.0.1'
    }
}

```

3 Resources

`mxonline.sql`: 测试数据

