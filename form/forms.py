import datetime

from django import forms
from django.core import validators
from django.core.exceptions import ValidationError
from form.models import Pacientes, Examenes

class FormularioUser(forms.Form):
    username= forms.CharField(error_messages={'required': 'Por favor ingresa tu nombre de usuario'})
    email = forms.EmailField(error_messages={'required': 'Por favor ingresa tu email'})
    password = forms.CharField(error_messages={'required': 'Por favor ingresa tu contraseña'})
    passwordConfirm = forms.CharField(error_messages={'required': 'Por favor ingresa tu contraseña'})


GEEKS_CHOICES =( 
    ("medico", "medico"),  
) 

class FormularioFuncionario(forms.Form):
    nombre = forms.CharField(error_messages={'required': 'Please enter your name'})
    rol = forms.ChoiceField(choices = GEEKS_CHOICES)

CHOICES =( 
    ("paciente", "paciente"),
    ("familiar", "familiar"),
    ("tutor", "tutor"),     
) 

class FormularioPacientes(forms.Form):
    rut = forms.CharField()
    nombre = forms.CharField()
    apellido = forms.CharField()
    email = forms.CharField()
    tutor = forms.CharField()
    direccion = forms.CharField()
    enfermedades = forms.CharField()
    rol = forms.ChoiceField(choices = CHOICES)

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

