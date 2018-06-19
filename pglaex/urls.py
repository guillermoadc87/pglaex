from django.contrib import admin
from django.urls import include, path, re_path
from django.views.static import serve
from django.conf import settings
from rest_framework_jwt.views import obtain_jwt_token, verify_jwt_token, refresh_jwt_token

urlpatterns = [
    path('pgla/', include('pgla.urls')),
    path(r'^api-token-auth', obtain_jwt_token),
    path(r'^api-token-verify', verify_jwt_token),
    path(r'^api-token-refresh', refresh_jwt_token),
    path('admin/', admin.site.urls),
    re_path(r'^media/(?P<path>.*)$', serve, {
            'document_root': settings.MEDIA_ROOT,
        }),
]
