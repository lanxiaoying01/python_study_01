# author Amelia
# 2023/8/7 21:06
from app01 import models
from django.shortcuts import render,redirect, HttpResponse
from django import forms
from io import BytesIO
from app01.utils.encrypt import md5
from app01.utils.code import check_code

class LoginForm(forms.Form):
    username = forms.CharField(
        label='用户名',
        widget=forms.TextInput(attrs={"class":"form-control"}),required=True
    )
    password = forms.CharField(
        label='密码',
        widget=forms.PasswordInput(attrs={"class":"form-control"}),required=True
    )

    code = forms.CharField(
        label='验证码',
        widget=forms.TextInput(attrs={"class":"form-control"}),required=True
    )

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

def login(request):
    """ 登录 """
    if request.method=='GET':
        form = LoginForm()
        return render(request, 'login.html',{'form':form})

    form = LoginForm(data=request.POST)
    if form.is_valid():
        # 验证成功，获取到的用户名和密码
        # {'username',:'123', 'password':'123'}
        # print(form.cleaned_date)
        user_input_code = form.cleaned_data.pop('code')
        code = request.session.get('image_code', "")
        if code.lower() != user_input_code:
            form.add_error("code","验证码错误")
            return render(request, 'login.html', {'form': form})

        # 去数据库校验用户和密码是否正确
        admin_object = models.Admin.objects.filter(**form.cleaned_data).first()
        if not admin_object:
            form.add_error('password', "用户名或密码错误")
            return render(request, 'login.html', {'form': form})

        # 用户名密码正确
        # 网站生成随机字符串；写到用户浏览器的coolie中，在写入session中
        request.session["info"] = {'id': admin_object.id, 'name': admin_object.username}
        # session设置7天失效
        request.session.set_expiry(60*60*24*7)
        return redirect('/admin/list')

    return render(request, 'login.html', {'form', form})

def logout(request):
    """ 注销 """
    request.session.clear()

    return redirect('/login')

def image_code(request):
    """ 生成图片验证码 """
    # 调用pillow函数，生成图片
    img, code_string = check_code()

    # 写入到自己的session中（以便于后续获取验证码再进行校验）
    request.session['image_code'] = code_string
    # 给session设置60s后超时
    request.session.set_expiry(60)

    stream = BytesIO()
    img.save(stream, 'png')

    return HttpResponse(stream.getvalue())