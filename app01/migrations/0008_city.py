# Generated by Django 4.2.4 on 2023-08-14 07:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0007_boss'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32, verbose_name='姓名')),
                ('count', models.IntegerField(verbose_name='人口')),
                ('img', models.FileField(max_length=128, upload_to='city', verbose_name='LOGO')),
            ],
        ),
    ]