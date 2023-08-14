# author Amelia
# 2023/8/7 15:09
from django.shortcuts import render,redirect
from app01 import models
from app01.utils.Pagination import Pagination
from app01.utils.form import PrettyModelForm, PrettyEditModelForm


""" 当编辑和新增字段个数不一样，或者属性不一样时，可以单独个编辑的Form """
def pretty_list(request):

    # 多条件查询
    data_dict = {}
    search_data = request.GET.get("q","") # 如果没有q，则赋值""
    if search_data:
        data_dict = {"mobile__contains":search_data}

    # 根据用户想要访问的页码，计算出起止位置
    queryset = models.PrettyNum.objects.filter(**data_dict).order_by("-lever")

    page_object = Pagination(request,queryset)

    context = {
        'queryset': page_object.page_queryset, # 分完页后的数据
        "search_data": search_data,
        "page_string": page_object.html() # 页码信息
    }

    return render(request,'pretty_list.html',context)

def pretty_add(request):
    if request.method=='GET':
        form = PrettyModelForm()
        return render(request, 'pretty_add.html', {'form': form})
    else:
        # POST提交，数据校验
        form = PrettyModelForm(data=request.POST)
        if form.is_valid():
            # 如果数据合法，保存到数据库
            form.save()
            return redirect('/pretty/list')
        else:
            return render(request, 'pretty_add.html', {'form': form})

def pretty_edit(request,nid):
    row_obj = models.PrettyNum.objects.filter(id=nid).first()
    if request.method=='GET':
        form = PrettyEditModelForm(instance=row_obj)
        return render(request, 'pretty_edit.html',{'form': form})

    # POST提交，数据校验
    form = PrettyEditModelForm(data=request.POST, instance=row_obj)
    if form.is_valid():
        # 如果想要在用户输入以外，增加其他字段赋值
        # form.instance.字段名 = 值
        # 如果数据合法，保存到数据库
        form.save()
        return redirect('/pretty/list')
    else:
        return render(request, 'pretty_edit.html', {'form': form})

def pretty_delete(request):
    nid = request.GET.get('nid')
    models.PrettyNum.objects.filter(id=nid).delete()
    return redirect('/pretty/list')
