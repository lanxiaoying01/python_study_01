# author Amelia
# 2023/8/8 22:13
from django.utils.deprecation import  MiddlewareMixin
from django.shortcuts import HttpResponse, redirect

class AuthMiddleware(MiddlewareMixin):
    """ 中间件1 """

    def process_request(self, request):

        ignore_list = [
            "/login",
            "/image/code",
            "/fenzhang/compute",
            "/fenzhang/create",
        ]

        # 0.排除那些不需要登录就能访问的页面
        # request.path_info 获取当前用户请求的URL  /login/
        if request.path_info in ignore_list:
            return

        # 1.读取当前访问的用户的session信息，如果能读到，说明已登录
        info_dict = request.session.get("info")
        if info_dict:
            return

        # 2.如果没有登录过，重新回到登录页面
        return redirect('/login')

    def process_response(self, request, response):
        print("M1.process_response")
        return response


# class M2(MiddlewareMixin):
#     """ 中间件2 """
#
#     def process_request(self, request):
#         print("M2.process_request")
#
#     def process_response(self, request, response):
#         print("M2,走了")
#         return response