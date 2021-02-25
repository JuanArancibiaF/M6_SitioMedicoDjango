from django.shortcuts import render, redirect
from .forms import FormularioPacientes, tipos_examenes
from .models import Pacientes, Examenes

from django.conf import settings

# C de CRUD
def crear_pacientes(request):
        if request.method=="GET":
            formulario = FormularioPacientes()
            contex = {'formulario':formulario}
            return render(request, 'form/crear_pacientes.html', contex)

        elif request.method=="POST":
            #print ("llego POST OK", request.POST)
            
            formulario_devuelto = FormularioPacientes(request.POST)
           
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data

            try:
                pac = Pacientes.objects.create(
                    rut=datos_formulario['rut'].replace('.', ''), 
                    nombre=datos_formulario['nombre'],
                    apellido=datos_formulario['apellido'],
                    email=datos_formulario['email'],
                    tutor=datos_formulario['tutor'],
                    direccion=datos_formulario['direccion'],
                    enfermedades=datos_formulario['enfermedades'],
                )
                pac.save()
                return redirect('form:pacientes_creados')
            except:
                formulario = FormularioPacientes()
                context = {'formulario':formulario, 'ERROR': True}
                return render(request, 'form/crear_pacientes.html', context)
        else:
            contex = {'formulario':formulario_devuelto}
            return render (request, 'form/crear_pacientes.html', contex )

#D de CRUD
def eliminar_pacientes(request, rut):
    if request.method == "GET":
        context = {'rut': rut}
        print('El rut de entrada es:', rut)
        return render(request, "form/eliminar_pacientes.html", context)
    if request.method == "POST":
        Pacientes.objects.filter(rut=rut).delete()
        print('El rut de entrada es:', rut)
        return redirect('form:pacientes_creados')

#U de CRUD
def editar_pacientes(request, rut):
    if request.method == "GET":
        edit_pac = Pacientes.objects.filter(rut=rut).values()[0]
        formulario = FormularioPacientes(initial=edit_pac)
        context = {'formulario': formulario, 'rut': rut}
        return render(request, 'form/editar_pacientes.html', context)

    elif request.method == "POST":
        print("El POST contiene:", request.POST)
        formulario_devuelto = FormularioPacientes(request.POST)
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data
            editados = Pacientes.objects.filter(rut=rut).update(
                            nombre=datos_formulario['nombre'],
                            apellido=datos_formulario['apellido'],
                            email=datos_formulario['email'],
                            tutor=datos_formulario['tutor'],
                            direccion=datos_formulario['direccion'],
                            enfermedades=datos_formulario['enfermedades']
                            )
            return redirect('form:pacientes_creados')
        else:
            context = {'formulario': formulario_devuelto}
            return render(request, 'form/editar_pacientes.html', context)

#R de CRUD
def pacientes_creados(request):
    pacientes = Pacientes.objects.all().values()
    print('Estos datos son los de pacientes:', list(pacientes))
    contex = {'lista_pacientes': list(pacientes)}
    return render(request, 'form/pacientes_creados.html',contex)




def ingresar_examenes(request):
    if request.method == "GET":
        examenes = tipos_examenes()
        context = {'examenes': examenes}
        return render(request, 'form/Ingresar_examenes.html', context)

    elif(request.method == "POST"):
        examenes_post = tipos_examenes(request.POST) 
        #print(type(examenes_post))
        if examenes_post.is_valid() == True:
            data = examenes_post.cleaned_data
            #data['fecha']=data['fecha'].strftime("%Y-%m-%d")
            print('Los datos de DATA [rut] son:', data['rut'])
            data['rut']= data['rut'].replace('.', '')
            try:
                paciente1=Pacientes.objects.filter(rut=data['rut'])[0]
                print('Los datos de Paciente 1 son:', paciente1)
                Examenes.objects.create(
                        orina= data['orina'],
                        glucosa= data['glucosa'],
                        colesterol= data['colesterol'],
                        triglicerido= data['triglicerido'],
                        bilirrubina= data['bilirrubina'],
                        fecha= data['fecha'],
                        paciente= paciente1
                        )
                return redirect('app1:fichaMedica')
            except:
                context = {'examenes': examenes_post, 'ERROR': True}
                return render(request, 'form/Ingresar_examenes.html', context)
        else:
            context = {'examenes': examenes_post, 'ERROR': True}
            return render(request, 'form/Ingresar_examenes.html', context)         
