# author Amelia
# 2023/8/7 15:09
from django.shortcuts import render,redirect
from app01 import models
from app01.utils.Pagination import Pagination
from app01.utils.form import UserModelForm

# Create your views here.
'''     用户管理         '''

def user_list(request):
    """ 用户列表 """
    # 去数据库获取部门列表
    queryset = models.UserInfo.objects.all()
    return render(request,'user_list.html',{'queryset': queryset})

def user_add(request):
    """ 添加用户 """
    if request.method=='GET':
        # content={
        #     'gender_choices': models.UserInfo.gender_choices,
        #     'dept_list': models.Department.objects.all()
        # }
        form = UserModelForm()
        return render(request, 'user_add.html', {'form': form})
    else:
        # POST提交，数据校验
        form = UserModelForm(data=request.POST)
        if form.is_valid():
            # 如果数据合法，保存到数据库
            form.save()
            return redirect('/user/list')
        else:
            return render(request, 'user_add.html', {'form': form})

def user_edit(request,nid):
    """ 修改用户 """
    row_obj = models.UserInfo.objects.filter(id=nid).first()
    if request.method=='GET':
        form = UserModelForm(instance=row_obj)
        return render(request, 'user_edit.html',{'form': form})

    # POST提交，数据校验
    form = UserModelForm(data=request.POST, instance=row_obj)
    if form.is_valid():
        # 如果想要在用户输入以外，增加其他字段赋值
        # form.instance.字段名 = 值
        # 如果数据合法，保存到数据库
        form.save()
        return redirect('/user/list')
    else:
        return render(request, 'user_add.html', {'form': form})

def user_delete(request):
    """ 删除用户 """
    nid = request.GET.get('nid')
    models.UserInfo.objects.filter(id=nid).delete()
    return redirect('/user/list')
