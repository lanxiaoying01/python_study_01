from django.db import models


# Create your models here.
class Admin(models.Model):
    """  管理员  """
    username = models.CharField(verbose_name="用户名", max_length=32)
    password = models.CharField(verbose_name="密码",max_length=64)

    def __str__(self):
        return self.username


class Department(models.Model):
    """ 部门表 """
    title = models.CharField(max_length=32,verbose_name='标题') # verbose_name 字段注释

    def __str__(self):
        return self.title


class UserInfo(models.Model):
    """ 员工 """
    name = models.CharField(verbose_name='姓名', max_length=16)
    password = models.CharField(verbose_name='密码', max_length=64)
    age = models.CharField(verbose_name='年龄', max_length=2)
    account = models.DecimalField(verbose_name='账户余额', max_digits=10, decimal_places=2, default=0)

    create_time = models.DateTimeField(verbose_name='入职时间')

    #无约束
    # dept_id = models.BigIntegerField(verbose_name='部门ID')

    #外键约束
    # - to,与那张表关联
    # - to_field,与表里的那一列关联
    # 注意：django自动会给dept在生成到mysql数据库中时变成dept_id
    # on_delete=models.SET_NULL 当部门删除时，员工部门列置空
    dept = models.ForeignKey(verbose_name="部门",to="Department", to_field="id", null=True, blank=True, on_delete=models.SET_NULL)

    # 从Django层面限制gender 1是男，2是女，只能是这两值
    gender_choices = (
        (1, '男'),
        (2, '女')
    )
    gender = models.SmallIntegerField(verbose_name='性别', choices=gender_choices)


class PrettyNum(models.Model):
    """ 靓号表 """
    # 设置默认空值 null=True,blank=True
    mobile = models.CharField(verbose_name='手机号', max_length=11)
    price = models.IntegerField(verbose_name='价格', default=0)

    lever_choice=(
        (1,'1级'),
        (2,'2级'),
        (3,'3级'),
        (4,'4级'),
    )
    lever = models.SmallIntegerField(verbose_name="级别",choices=lever_choice,default=1)

    status_choices = (
        (1, '已占用'),
        (2, '未使用'),
    )
    status = models.SmallIntegerField(verbose_name="状态",choices=status_choices,default=2)


class Task(models.Model):
    """ 任务 """
    lever_choices = (
        (1, '紧急'),
        (2, '重要'),
        (3, '临时')
    )
    level = models.SmallIntegerField(verbose_name='级别', choices=lever_choices, default=1)
    title = models.CharField(verbose_name='标题', max_length=64)
    detail = models.TextField(verbose_name='详细信息')
    user = models.ForeignKey(verbose_name='负责人',to='Admin', to_field='id', on_delete=models.CASCADE)


class Order(models.Model):
    """ 订单 """
    oid = models.CharField(verbose_name="订单号", max_length=64)
    title = models.CharField(verbose_name="名称", max_length=32)
    price = models.IntegerField(verbose_name="价格", default=0)

    status_choices = (
        (1, "待支付"),
        (2, "已支付")
    )

    status = models.SmallIntegerField(verbose_name="状态", choices=status_choices, default=1)
    admin = models.ForeignKey(verbose_name="管理员", to="Admin", on_delete=models.CASCADE)


class Boss(models.Model):
    """ 老板 """
    name = models.CharField(verbose_name="姓名", max_length=32)
    age = models.IntegerField(verbose_name="年龄")
    img = models.CharField(verbose_name="头像", max_length=128)


class City(models.Model):
    """ 城市 """
    name = models.CharField(verbose_name="城市", max_length=32)
    count = models.IntegerField(verbose_name="人口")
    # FileField本质上数据库也是CharField，自动保存数据(使用upload_to自动上传到media目录家下的city文件夹里)
    img = models.FileField(verbose_name="LOGO", max_length=128, upload_to='city')

class FenZhang(models.Model):
    """ 分账 """
    name = models.CharField(verbose_name="用户名字", max_length=32)
    count = models.IntegerField(verbose_name="数量")
    huafei = models.IntegerField(verbose_name="花费")
    shoukuan = models.IntegerField(verbose_name="收款")
    owner = models.CharField(verbose_name="拥有者", max_length=128, null=True, blank=True,)
