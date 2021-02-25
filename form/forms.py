import datetime

from django import forms
from django.core import validators
from django.core.exceptions import ValidationError
from form.models import Pacientes, Examenes


class FormularioPacientes(forms.Form):
    rut = forms.CharField()
    nombre = forms.CharField()
    apellido = forms.CharField()
    email = forms.CharField()
    tutor = forms.CharField()
    direccion = forms.CharField()
    enfermedades = forms.CharField()

class EditarPacientes(forms.Form):
    nombre = forms.CharField()
    apellido = forms.CharField()
    email = forms.CharField()
    tutor = forms.CharField()
    direccion = forms.CharField()
    enfermedades = forms.CharField()

class tipos_examenes(forms.Form):
    rut = forms.CharField()
    orina = forms.IntegerField()
    glucosa = forms.IntegerField()
    colesterol = forms.IntegerField()
    triglicerido = forms.IntegerField()
    bilirrubina = forms.IntegerField()
    fecha = forms.DateField()

