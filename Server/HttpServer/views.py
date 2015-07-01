# -*- coding: utf-8 -*-
import json
from django.shortcuts import render
from django.http import HttpResponse, Http404
from django.views.decorators.csrf import csrf_exempt
from models import signon

# Create your views here.

# 注册
@csrf_exempt
def user_signon(request):
    if request.method == 'POST':
        try:
            username = request.POST['username']
            password = request.POST['password']
            email = request.POST['email']
            user_if_exist = signon.objects.filter(email = email)
            # if  user_if_exist.count() == 0:
            #     signon.objects.create(username = username, password = password, email = email)
            # else:
            #     result = {"state":"0", 'msg':"Email exist."}
            #     encode_json_result = json.dumps(result)
            #     return HttpResponse(encode_json_result)
            # signon.objects.filter(username = 'ShengQiang').delete()

        except KeyError:
            print("KeyError : ", KeyError.message)
            raise Http404
        except TabError:
            print("TabError : ", TabError.message)
            raise Http404
        except TypeError:
            print("TypeError : ", TabError.message)
            raise Http404
        # print('%d', user.count())

        s = signon.objects.filter(username = 'ShengQiang').first()
        # print s.username, s.email, s.id

        result = {"state":"1", "userid":s.id, 'msg':"success"}
        encode_json_result = json.dumps(result)
        return HttpResponse(encode_json_result)

    elif request.method == 'GET':
        result = {"state":"1", "userid":1, 'msg':"success"}
        encode_json_result = json.dumps(result)
        return HttpResponse(encode_json_result)

    else:
        return HttpResponse("error request.")

# 登录
@csrf_exempt
def user_signin(request):
    pass
