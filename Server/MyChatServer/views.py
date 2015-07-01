# -*- coding: utf-8 -*-
from django.shortcuts import render

# Create your views here.
import json
from django.http import HttpResponse, Http404
from django.views.decorators.csrf import csrf_exempt
from models import sign_in, sign_on

# 测试
def test(request):
    return HttpResponse('Hello World.')


#注册
@csrf_exempt
def user_sign_on(request):
    if request.method == 'POST':
        try:
            if sign_on.objects.filter(request.POST['email']) == 0:
                sign_on.objects.create(nickname = request.POST['nickname'], password = request.POST['password'], email = request.POST['email'])
                obj  = sign_on.objects.filter(email = request.POST['email']).first()
                result = {"state":"1", "userid":obj.id, "msg":"success"}
                encode_result = json.dumps(result)
                return encode_result
            else:
                result = {"state":"0", "msg":"Email exist."}
                encode_result = json.dumps(result)
                return encode_result
        except KeyError | TabError | TypeError:
            raise Http404
    else:
        result = {"state":"0", "msg":"Method is not post."}
        encode_result = json.dumps(result)
        return HttpResponse(encode_result)

#登录
@csrf_exempt
def user_sign_in(request):
    pass