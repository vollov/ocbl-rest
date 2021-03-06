"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin

import views

from rest_framework import routers
from authentication.views import AccountViewSet, LoginView, LogoutView

router = routers.SimpleRouter()
router.register(r'accounts', AccountViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/v1/', include(router.urls)),
    url(r'^api/v1/login$', LoginView.as_view(), name='login'),
    url(r'^api/v1/logout$', LogoutView.as_view(), name='logout'),
]

# settings for development environment DEBUG
from django.conf.urls.static import static
from django.conf import settings

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
 
# if settings.DEBUG:
#     urlpatterns += [
#         url((r'^media/(?P<path>.*)','django.views.static', {'document_root': settings.MEDIA_ROOT}),'serve')
#     ]
    