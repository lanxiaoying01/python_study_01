"""
URL configuration for employee_mangement_system project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from django.views.static import serve
from django.conf import settings
from app01.views import dept, user, pretty, admin, account, task, order, chart, upload, city, fenzhang

urlpatterns = [
    re_path(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}, name='media'),
    # 部门管理
    path('dept/list', dept.dept_list),
    path('dept/add', dept.dept_add),
    path('dept/delete', dept.dept_delete),
    path('dept/<int:nid>/edit', dept.dept_edit),
    path('dept/multi', dept.dept_multi),

    # 用户管理
    path('user/list', user.user_list),
    path('user/add', user.user_add),
    path('user/<int:nid>/edit', user.user_edit),
    path('user/delete', user.user_delete),

    # 靓号管理
    path('pretty/list', pretty.pretty_list),
    path('pretty/add', pretty.pretty_add),
    path('pretty/<int:nid>/edit', pretty.pretty_edit),
    path('pretty/delete', pretty.pretty_delete),

    # 管理员管理
    path('admin/list', admin.admin_list),
    path('admin/add', admin.admin_add),
    path('admin/<int:nid>/edit', admin.admin_edit),
    path('admin/delete', admin.admin_delete),
    path('admin/<int:nid>/reset', admin.admin_reset),

    # 登录
    path('login', account.login),
    path('logout', account.logout),
    path('image/code', account.image_code),

    # 任务管理
    path('task/list', task.task_list),
    path('task/add', task.task_add),

    # 订单管理
    path('order/list', order.order_list),
    path('order/add', order.order_add),
    path('order/<int:nid>/delete', order.order_delete),
    path('order/detail', order.order_detail),
    path('order/<int:nid>/edit', order.order_edit),

    # 图表
    path('chart/list', chart.chart_list),
    path('chart/bar', chart.chart_bar),
    path('chart/pie', chart.chart_pie),
    path('chart/line', chart.chart_line),

    # 上传
    path('upload/form', upload.upload_form),
    path('upload/modal/form', upload.upload_modal_form),

    # 城市管理
    path('city/list', city.city_list),

    # 分账管理
    path('fenzhang/compute', fenzhang.compute),
    path('fenzhang/create', fenzhang.create),
    path('fenzhang/<int:nid>/modify', fenzhang.modify),

]
