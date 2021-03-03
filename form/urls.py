from django.urls import path
from . import views


app_name='form'

urlpatterns = [
    path('crear_user/', views.crear_user, name='crear_user'),
    path('crear_pacientes/', views.crear_pacientes, name='crear_pacientes'),
    path('<rut>/editar_pacientes', views.editar_pacientes, name='editar_pacientes'),
    path('<rut>/eliminar_pacientes', views.eliminar_pacientes, name='eliminar_pacientes'),
    path('pacientes_creados/', views.pacientes_creados, name='pacientes_creados'),
    path('ingresar_examenes/', views.ingresar_examenes, name='ingresar_examenes'),
]