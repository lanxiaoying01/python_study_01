# author Amelia
# 2023/8/10 14:52
import json

from django.shortcuts import render,redirect, HttpResponse
from django.views.decorators.csrf import csrf_exempt

from app01 import models
from app01.utils.bootstrap import BootStrapModelForm

class TaskModelForm(BootStrapModelForm):
    class Meta:
        model = models.Task
        fields = "__all__"

#get请求
def task_list(request):
    """ 任务劣币哦啊 """
    content = {
        'form': TaskModelForm()
    }
    return render(request, "task_list.html", content)


#post请求 为避免出现csrf 403问题
@csrf_exempt
def task_add(request):
    print(request.POST)
    #  1.用户发送过来的数据进行校验（ModelForm进行校验)
    form = TaskModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        data_dict = {"status": True}
        return HttpResponse(json.dumps(data_dict))

    data_dict = {"status": False, "error": form.errors}

    return HttpResponse(json.dumps(data_dict, ensure_ascii=False))