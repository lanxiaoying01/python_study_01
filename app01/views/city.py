# author Amelia
# 2023/8/14 15:49
from django.shortcuts import render,redirect,HttpResponse
from app01 import models

def city_list(request):
    """ 部门列表 """
    # 去数据库获取部门列表
    queryset = models.City.objects.all()
    return render(request,'city_list.html',{'queryset': queryset})
