# django cmd

* 创建工程项目
>django-admin startproject project-name

* 创建app
> python manage.py startapp app_name

* models修改后执行，生成变更文件
> python manage.py makemigrations
* 将models的变更应用到数据库
> python manage.py migrate

* 当提示端口被占用的时候，可以用其它端口：
> python manage.py runserver 8001
* 监听机器所有可用 ip （电脑可能有多个内网ip或多个外网ip）
> python manage.py runserver 0.0.0.0:8000

* 清空数据库
> python manage.py flush

* 创建超级管理员
> python manage.py createsuperuser

* 修改 用户密码可以用：
> python manage.py changepassword username

* 数据的导出和导入
> python manage.py dumpdata appname > appname.json
> python manage.py loaddata appname.json


# mysql cmd

* 创建数据库
CREATE DATABASE utf8_database_name DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE gbk_database_name DEFAULT CHARACTER SET gbk COLLATE gbk_chinese_ci;

* 登录数据库
> mysql -u root -p

* 显示数据库版本
> select version();

* 显示当前用户
> select user();

* 查看一共有多少用户
> select user,host from mysql.user;

* 显示所有的数据库
> show databases;

* 使用某个数据库
> use database_name;

* 创建表
> create table table_name( id int(4), name varchar(16));

* 增加字段
> alter table test add age tinyint(2) after id;

* 查看表结构
> desc table_name;
> show columns from test;

* 插入数据
> insert into table_name values(1,'oldboy');
> insert into table_name values(2,'老男孩'),(3,'etiantian');

* 查看表的数据
> select * from test;
> select * from test where name='oldboy';
> select * from test where id>1;

* 删除表中所有数据
> delete from test;

> drop table test;     删除表
> drop database test;  删除库


* 修改表的数据
> update test set name='oldgirl' where id=1;

* 创建数据库的管理用户
> grant all on database_name.* to user_name@localhost identified by 'password';


# 本地项目push到GitHub
#### 命令行模式操作
* 1 在github创建一个同名的空仓库
* 2 命令行进入本地工程目录，执行下面命令
(下面尖括号中的地址为第一步创建的空仓库地址)
```shell
git init
git add .
git commit -m "first commit"
git remote add origin <https://github.com/lijinzhou2016/MxOnline.git>
git push -u origin master
```
#### Pycharm 操作
* PyCharm --> Preferences
* Version Control --> GitHub
* VCS --> import into Version Control --> Share Project on GitHub

# xadmin后台中models的显示名称配置,如 users app：
* 1 在 __init__.py中：
```python
default_app_config = "users.apps.UsersConfig"
```
* 2 在apps.py中：
```python
from django.apps import AppConfig

class UsersConfig(AppConfig):
    name = 'users'
    # 在后台显示的名称为 "用户信息"
    verbose_name = '用户信息'
```

# 注册models中的外键字段,如 Lesson中的course
```python
# 格式：foreignkey__field
class LessonAdmin(object):
    list_display = ("id", "course", "name", "create_time")
    search_fields = ("course__name", "name")
    list_filter = ("course__name", "create_time", "update_time")
```

# xadmin后台中，image不显示问题解决办法
* 1 seetings.py的配置如下：
```python
    MEDIA_URL = "/media/"
    MEDIA_ROOT = os.path.join(BASE_DIR, "media")
    
    TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                ...
                'django.core.context_processors.media'   # media处理类, 注册MEDIA_URL
            ],
        },
    },
]
```
* 2 在urls.py中的配置
```python
from django.conf.urls import url
from django.views.static import serve
from .settings import MEDIA_ROOT

urlpatterns = [
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT})
]
```
* 3 html中引用
```html
# org.image：model中的image字段
<img width="200" height="120" data-url="{{ MEDIA_URL }}{{ org.image }}"/>
```

# 验证码插件
* https://django-simple-captcha.readthedocs.io/en/latest/usage.html#installation
```python
pip install  django-simple-captcha
```

# 分页插件

* [https://github.com/jamespacileo/django-pure-pagination](https://github.com/jamespacileo/django-pure-pagination)
 
```python
# install
pip install django-pure-pagination

# settings.py中的配置
INSTALLED_APPS = (
    ...
    'pure_pagination',
)

PAGINATION_SETTINGS = {
    'PAGE_RANGE_DISPLAYED': 10,
    'MARGIN_PAGES_DISPLAYED': 2,

    'SHOW_FIRST_PAGE_WHEN_INVALID': True,
}

```