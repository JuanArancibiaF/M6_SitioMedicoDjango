# Generated by Django 3.1.7 on 2021-03-05 21:39

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Pacientes',
            fields=[
                ('rut', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=25)),
                ('apellido', models.CharField(max_length=25)),
                ('email', models.CharField(max_length=50)),
                ('tutor', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=50)),
                ('enfermedades', models.CharField(max_length=50)),
                ('rol', models.CharField(default='sin asignar', max_length=50)),
                ('usuario', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Funcionario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25)),
                ('rol', models.CharField(default='medico', max_length=50)),
                ('usuario', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Examenes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('orina', models.IntegerField()),
                ('glucosa', models.IntegerField()),
                ('colesterol', models.IntegerField()),
                ('triglicerido', models.IntegerField()),
                ('bilirrubina', models.IntegerField()),
                ('fecha', models.DateField()),
                ('paciente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='form.pacientes')),
            ],
        ),
    ]
