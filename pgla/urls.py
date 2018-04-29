from django.urls import path

from . import views

urlpatterns = [
    path('links/', views.links, name='links'),
    path('connect/<hostname>/', views.connect_to_pe, name='connect_to_pe'),
]