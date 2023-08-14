# author Amelia
# 2023/8/11 12:01
# import json
import random
from datetime import datetime
from django.shortcuts import render, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from app01 import models
from app01.utils.bootstrap import BootStrapModelForm
from app01.utils.Pagination import Pagination


class OrderModelForm(BootStrapModelForm):
    class Meta:
        model = models.Order
        fields = "__all__"
        exclude = ['oid','admin']

def order_list(request):
    ''' 订单列表 '''
    # 多条件查询
    data_dict = {}
    search_data = request.GET.get("q","") # 如果没有q，则赋值""
    if search_data:
        data_dict = {"mobile__contains":search_data}

    # 根据用户想要访问的页码，计算出起止位置
    queryset = models.Order.objects.filter(**data_dict).order_by("-id")

    queryset = models.Order.objects.all().order_by("-id")
    page_object = Pagination(request,queryset)

    context = {
        'queryset': page_object.page_queryset, # 分完页后的数据
        "search_data": search_data,
        "page_string": page_object.html(), # 页码信息
        "form": OrderModelForm()
    }
    return render(request, 'order_list.html',context)


# 新建订单
#post请求 为避免出现csrf 403问题
@csrf_exempt
def order_add(request):
    print(request.POST)
    #  1.用户发送过来的数据进行校验（ModelForm进行校验)
    form = OrderModelForm(data=request.POST)
    if form.is_valid():
        # oid
        form.instance.oid = datetime.now().strftime("%Y%m%d%H%M%S") + str(random.randint(1000,9999))
        form.instance.admin_id = request.session['info']["id"]

        form.save()
        data_dict = {"status": True}
        # return HttpResponse(json.dumps(data_dict))
        return JsonResponse({"status":True})

    data_dict = {"status": False, "error": form.errors}

    return JsonResponse(data_dict)


def order_delete(request,nid):
    exists = models.Order.objects.filter(id = nid).exists()
    if not exists:
        return JsonResponse({"status": False, "msg": "数据不存在"})

    models.Order.objects.filter(id=nid).delete()
    return JsonResponse({"status": True, "msg": "删除成功"})

def order_detail(request):
    uid = request.GET.get("uid")
    row_dict = models.Order.objects.filter(id = uid).values("id","price","title").first()
    if not row_dict:
        return JsonResponse({"status": False, "msg": "数据不存在"})

    result = {
        "data": row_dict,
        "status": True
    }
    return JsonResponse(result)


@csrf_exempt
def order_edit(request,nid):
    row_obj = models.Order.objects.filter(id=nid).first()
    if not row_obj:
        return JsonResponse({"status": False, "msg": "数据不存在"})

    # POST提交，数据校验
    form = OrderModelForm(data=request.POST, instance=row_obj)
    if form.is_valid():
        # 如果想要在用户输入以外，增加其他字段赋值
        # form.instance.字段名 = 值
        # 如果数据合法，保存到数据库
        form.save()
        return JsonResponse({"status": True})

    return JsonResponse({"status": False, "error": form.errors})