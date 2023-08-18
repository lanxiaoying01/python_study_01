# author Amelia
# 2023/8/18 10:10
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from decimal import Decimal


# 分账计算
@csrf_exempt
def compute(request):
    msg_list = []
    raw_data = request.body
    lst = json.loads(raw_data).get('user_list')
    # lst=[{'name':'Chris','huafei':321,'shoukuan':0,'count':1},
    #      {'name':'Amelia','huafei':109,'shoukuan':0,'count':2},
    #      {'name':'Wendy','huafei':33,'shoukuan':0,'count':2},
    #      {'name':'Suki','huafei':12,'shoukuan':0,'count':1}]
    sum = 0
    for item in lst:
        sum += item.get("huafei")

    msg_list.append('总费用：{0}'.format(sum))

    total_count = 0
    for item in lst:
        total_count += item.get("count")
    pingjun = sum / total_count
    # print('平均费用：',Decimal(pingjun).quantize(Decimal("0.00")))
    msg_list.append('平均费用：{0}'.format(Decimal(pingjun).quantize(Decimal("0.00"))))

    lst2=[]
    lst3=[]
    for item in lst:
        if item.get("huafei")>(pingjun*item.get("count")):
            lst2.append(item)
        elif item.get("huafei")<(pingjun*item.get("count")):
            lst3.append(item)

    # print('收钱人',lst2)
    # print('给钱人',lst3)
    for item in lst3:
        geichu = (pingjun*item.get("count"))-item.get("huafei")
        for u in lst2:
            if u.get("huafei")-u.get("shoukuan")>pingjun:
                # 需要收款
                yingshou = u.get('huafei')-pingjun*u.get("count")
                if yingshou>=geichu: # u 收了 item 给的，却还不够，还需要其他人补
                    u['shoukuan']=u['shoukuan']+geichu
                    # print('{0} 给 {1} {2}元'.format(item.get('name'),u.get('name'),Decimal(geichu).quantize(Decimal("0.00"))))
                    msg_list.append('{0} 给 {1} {2}元'.format(item.get('name'),u.get('name'),Decimal(geichu).quantize(Decimal("0.00"))))
                    geichu = 0
                    break
                else:
                    u['shoukuan'] = u['shoukuan']+yingshou
                    geichu = geichu - yingshou  # u 不需要收 item这么多钱，item剩下的钱可以补给其他应收款人
                    msg_list.append('{0} 给 {1} {2}元'.format(item.get('name'),u.get('name'),Decimal(yingshou).quantize(Decimal("0.00"))))
                    # print('{0} 给 {1} {2}元'.format(item.get('name'),u.get('name'),Decimal(yingshou).quantize(Decimal("0.00"))))
            else:
                continue

    print(msg_list)
    return JsonResponse({'msg_list':msg_list})
