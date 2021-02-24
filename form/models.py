import datetime
from django.db import models
from django.core import validators
from django.core.exceptions import ValidationError


# Create your models here.
class Pacientes(models.Model):
    rut = models.CharField(max_length=10, primary_key=True)
    nombre = models.CharField(max_length=25)
    apellido = models.CharField(max_length=25)
    email = models.CharField(max_length=50)
    tutor = models.CharField(max_length=50)
    direccion = models.CharField(max_length=50)
    enfermedades = models.CharField(max_length=50)

class Examenes(models.Model):
    orina = models.IntegerField()
    glucosa = models.IntegerField()
    colesterol = models.IntegerField()
    triglicerido = models.IntegerField()
    bilirrubina = models.IntegerField()
    fecha = models.DateField()
    paciente = models.ForeignKey(Pacientes, on_delete=models.CASCADE)
