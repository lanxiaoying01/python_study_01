# author Amelia
# 2023/8/7 15:04
from django import forms
from django.core.validators import RegexValidator  # 正则
from django.core.exceptions import ValidationError # 错误信息
from app01 import models
from app01.utils.bootstrap import BootStrapModelForm
from app01.utils.encrypt import md5


class UserModelForm(BootStrapModelForm):
    class Meta:
        model = models.UserInfo
        fields=['name','password','age','account','gender','dept','create_time']


class PrettyModelForm(BootStrapModelForm):
    # 增加自定义校验 方式1
    mobile = forms.CharField(
        label='手机号',
        validators=[RegexValidator(r'^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\d{8}$', '手机号码格式错误')]
    )
    class Meta:
        model = models.PrettyNum
        fields = ["mobile","price","lever","status"]
        # fields = "__all__" #所有字段
        # exclude = ["level"] # 排除某个字段

    # 增加自定义校验 方式2
    def clean_mobile(self):
        txt_mobile = self.cleaned_data["mobile"]
        # 新增的时候在钩子方法里 检查数据库mobile是否存在
        exists = models.PrettyNum.objects.filter(mobile=txt_mobile).exists()
        if exists:
            # 验证不通过
            raise ValidationError('手机号已存在')

        # 把用户输入的值返回
        return txt_mobile


class PrettyEditModelForm(BootStrapModelForm):
    # 编辑时，mobile字段不允许编辑
    mobile = forms.CharField(disabled=True, label='手机号')

    class Meta:
        model = models.PrettyNum
        # 如果编辑时某个字段显示，则直接在fields里去掉
        fields = ["mobile","price","lever","status"]


class AdminModelForm(BootStrapModelForm):
    confirm_password = forms.CharField(label="确认密码", widget=forms.PasswordInput(render_value=True))

    class Meta:
        model = models.Admin
        fields=['username','password','confirm_password']
        widgets = {
            "password": forms.PasswordInput(render_value=True)
        }

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

    def clean_confirm_password(self):
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if confirm != pwd:
            raise ValidationError("密码不一致")
        return confirm


class AdminEditModelForm(BootStrapModelForm):

    class Meta:
        model = models.Admin
        fields=['username']



class AdminResetModelForm(BootStrapModelForm):
    confirm_password = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(render_value=True)
    )

    class Meta:
        model = models.Admin
        fields=['password','confirm_password']
        widgets = {
            "password": forms.PasswordInput(render_value=True)
        }

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        md5_pwd = md5(pwd)

        # 去数据库校验当前密码和新输入的密码是否一致
        exits = models.Admin.objects.filter(id=self.instance.pk, password=md5_pwd).exists()
        if exits:
            raise ValidationError('密码不能与以前的一致')
        return md5_pwd

    def clean_confirm_password(self):
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if confirm != pwd:
            raise ValidationError("密码不一致")
        return confirm

