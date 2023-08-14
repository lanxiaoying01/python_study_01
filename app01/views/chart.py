# author Amelia
# 2023/8/11 18:51
from django.shortcuts import render
from django.http import JsonResponse


def chart_list(request):
    """数据统计页面"""
    return render(request,'chart_list.html')

def chart_bar(request):
    """ 构造柱状图数据 """
    legend = ["梁吉宁"]
    series_list = [
              {
                "name": '销量',
                "type": 'bar',
                "data": [5, 20, 36, 10, 10, 20]
              }
            ]
    x_axis = ["1月","2月","3月","4月","5月","6月"]

    result = {
        "status": True,
        "data":{
            'legend': legend,
            "series": series_list,
            "xAxis": x_axis
        }
    }

    return JsonResponse(result)


def chart_pie(request):
    """ 构造饼状图数据 """
    series_list = [{"value": 1048, "name": 'IT部门'},
                    {"value": 735, "name": '运营'},
                    {"value": 580, "name": '新媒体'},
                    {"value": 484, "name": '销售'},
                    {"value": 300, "name": '商务'}]

    result = {
        "status": True,
        "data":{
            "series": series_list,
        }
    }

    return JsonResponse(result)


def chart_line(request):
    """ 构造折线图数据 """
    legend = ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
    series_list = [
                {
                  "name": 'Email',
                  "type": 'line',
                  "stack": 'Total',
                  "data": [120, 132, 101, 134, 90, 230, 210]
                },
                {
                  "name": 'Union Ads',
                  "type": 'line',
                  "stack": 'Total',
                  "data": [220, 182, 191, 234, 290, 330, 310]
                },
                {
                  "name": 'Video Ads',
                  "type": 'line',
                  "stack": 'Total',
                  "data": [150, 232, 201, 154, 190, 330, 410]
                },
                {
                  "name": 'Direct',
                  "type": 'line',
                  "stack": 'Total',
                  "data": [320, 332, 301, 334, 390, 330, 320]
                },
                {
                  "name": 'Search Engine',
                  "type": 'line',
                  "stack": 'Total',
                  "data": [820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
    x_axis = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

    result = {
        "status": True,
        "data":{
            'legend': legend,
            "series": series_list,
            "xAxis": x_axis
        }
    }

    return JsonResponse(result)
