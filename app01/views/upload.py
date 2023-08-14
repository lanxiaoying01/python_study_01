# author Amelia
# 2023/8/14 13:40
import os

from django.shortcuts import render,HttpResponse
from django import forms
from app01.utils.bootstrap import BootStrapForm,BootStrapModelForm
from app01 import models
from django.conf import settings


class UpForm(BootStrapForm):
    bootstrap_exclude_fields = ['img']

    name = forms.CharField(label="姓名")
    age = forms.IntegerField(label="年龄")
    img = forms.FileField(label="头像")


def upload_form(request):
    title = 'Form上传'
    if request.method == 'GET':
        form = UpForm()
        return render(request, 'upload_form.html', {'form':form, 'title':title})

    form = UpForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        print(form.cleaned_data)
        # 1.读取图片内容，写入到文件夹中获取文件的路径
        image_object = form.cleaned_data.get("img")
        # db_file_path = os.path.join("static","img", image_object.name)
        media_path = os.path.join("media", image_object.name)
        # file_path = os.path.join("app01",db_file_path)
        f = open(media_path, mode='wb')
        for chunk in image_object.chunks():
            f.write(chunk)

        f.close()

        # 2.将图片文件路径写入数据库
        models.Boss.objects.create(
            name = form.cleaned_data["name"],
            age=form.cleaned_data["age"],
            img=media_path
        )

        return HttpResponse("...")


    return render(request, 'upload_form.html', {'form':form, 'title':title})


class UpModalForm(BootStrapModelForm):
    bootstrap_exclude_fields = ["img"]
    class Meta:
        model = models.City
        fields = '__all__'

def upload_modal_form(request):
    """ 上传文件和数据 """
    title = "ModalForm上传文件"
    if request.method=='GET':
        form = UpModalForm()
        return render(request, 'upload_form.html', {"form":form,"title": title})

    form = UpModalForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        # 对于文件：自动保存
        # 字段 + 上传路径写入到数据库
        form.save()
        return HttpResponse("成功")

    return render(request, 'upload_form.html', {"form": form, "title": title})