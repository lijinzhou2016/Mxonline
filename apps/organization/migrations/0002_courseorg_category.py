# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2019-01-31 21:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseorg',
            name='category',
            field=models.CharField(choices=[('gr', '\u4e2a\u4eba'), ('gx', '\u9ad8\u6821'), ('pxjg', '\u57f9\u8bad\u673a\u6784')], default='pxjg', max_length=20, verbose_name='\u673a\u6784\u7c7b\u522b'),
        ),
    ]
