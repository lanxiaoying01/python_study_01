# author Amelia
# 2023/8/7 15:37
from app01 import models
from django.shortcuts import render,redirect
from app01.utils.Pagination import Pagination
from app01.utils.form import AdminModelForm, AdminEditModelForm, AdminResetModelForm

def admin_list(request):
    data_dict = {}
    search_data = request.GET.get("q","") # 如果没有q，则赋值""
    if search_data:
        data_dict = {"mobile__contains":search_data}

    queryset = models.Admin.objects.filter(**data_dict)

    page_object = Pagination(request, queryset)

    context = {
        'queryset': page_object.page_queryset,  # 分完页后的数据
        "search_data": search_data,
        "page_string": page_object.html()  # 页码信息
    }
    return render(request,'admin_list.html',context)


def admin_add(request):
    title = "新建管理员"

    if request.method=='GET':
        form = AdminModelForm()
        return render(request, 'change.html', {'title': title,'form':form})

    # POST提交，数据校验
    form = AdminModelForm(data=request.POST)
    if form.is_valid():
        # 如果数据合法，保存到数据库
        form.save()
        return redirect('/admin/list')

    return render(request, 'change.html', {'form': form})


def admin_edit(request,nid):
    title = "编辑管理员"
    row_obj = models.Admin.objects.filter(id=nid).first()

    if not row_obj:
        return redirect('/admin/list')

    if request.method=='GET':
        form = AdminEditModelForm(instance=row_obj)
        return render(request, 'change.html',{'title': title,'form':form})

    # POST提交，数据校验
    form = AdminEditModelForm(data=request.POST, instance=row_obj)
    if form.is_valid():
        # 如果想要在用户输入以外，增加其他字段赋值
        # form.instance.字段名 = 值
        # 如果数据合法，保存到数据库
        form.save()
        return redirect('/admin/list')
    else:
        return render(request, 'change.html', {'title': title,'form':form} )


def admin_delete(request):
    nid = request.GET.get('nid')
    models.Admin.objects.filter(id=nid).delete()
    return redirect('/admin/list')


def admin_reset(request,nid):
    """ 重置密码 """
    row_obj = models.Admin.objects.filter(id=nid).first()

    title = "重置密码 - {}".format(row_obj.username)
    if not row_obj:
        return redirect('/admin/list')

    if request.method=='GET':
        form = AdminResetModelForm()
        return render(request, 'change.html',{'title': title,'form':form})

    # POST提交，数据校验
    form = AdminResetModelForm(data=request.POST, instance=row_obj)
    if form.is_valid():
        form.save()
        return redirect('/admin/list')
    else:
        return render(request, 'change.html', {'title': title,'form':form} )
