from django.conf.urls import patterns, include, url
from django.contrib import admin
# from HttpServer import views
from MyChatServer import views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'Server.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    # url(r'^admin/', include(admin.site.urls)),
    # url(r'^signon/$', views.user_signon),

    # MyChatServer
    url(r'^test/$', views.test),

    url(r'^user/signon/$', views.user_sign_on),
)
