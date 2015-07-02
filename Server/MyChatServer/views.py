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
    print(request.POST)
    if request.method == 'POST':
        receive_nickname = request.POST['nickname']
        receive_password = request.POST['password']
        receive_email = request.POST['email']
        try:
            user_if_exist = sign_on.objects.filter(email = receive_email)
            if  user_if_exist.count() == 0:
                sign_on.objects.create(nickname = receive_nickname, password = receive_password, email = receive_email)
                obj  = sign_on.objects.filter(email = request.POST['email']).first()
                result = {"state":"1", "userid":obj.id, "msg":"success"}
                encode_result = json.dumps(result)
                return HttpResponse(encode_result)
            else:
                result = {"state":"0", "msg":"Email exist."}
                encode_result = json.dumps(result)
                return HttpResponse(encode_result)
        except KeyError:
            raise Http404
        except TypeError:
            raise Http404
        except TabError:
            raise Http404
    else:
        result = {"state":"0", "msg":"Method is not post."}
        encode_result = json.dumps(result)
        return HttpResponse(encode_result)


#登录
@csrf_exempt
def user_sign_in(request):
    if request.method == 'POST':
        receive_password = request.POST['password']
        receive_email = request.POST['email']
        try:
            user_if_exist = sign_on.objects.first(email = receive_email)
            if user_if_exist.count() == 1:
                pass
        except KeyError:
            raise Http404
        except TypeError:
            raise Http404
        except TabError:
            raise Http404
    else:
        result = {"state":"0", "msg":"Method is not post."}
        encode_result = json.dumps(result)
        return HttpResponse(encode_result)