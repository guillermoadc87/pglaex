from django.urls import path

from . import views

urlpatterns = [
    path('links/', views.links, name='links'),
    path('exec_command/<pk>/<command>', views.exec_command, name='exec_command'),
    path('cpe/exec_command/<pk>/<command>', views.exec_command, {'cpe': True}, name='exec_command'),
]