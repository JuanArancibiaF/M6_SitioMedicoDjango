from django.contrib import admin
from .models import Pacientes

# Register your models here.

class PerfilAdmin(admin.ModelAdmin):
    fields = ['usuario', 'tutor', 'direccion', 'rol'] # campos para edicion
    list_display=('usuario','rut', 'rol', 'nombre', 'apellido', 'direccion', 'enfermedades') # campos para lista
    list_filter = ['rut', 'nombre']
    search_fields = ['descripcion', 'rol', 'direccion']

admin.site.register(Pacientes, PerfilAdmin)