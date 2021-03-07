from django.shortcuts import render, redirect
from .forms import FormularioPacientes, tipos_examenes, FormularioUser, FormularioFuncionario
from .models import Pacientes, Examenes, Funcionario
from django.contrib.auth.models import User

from django.conf import settings


def crear_funcionario(request):
    formularioUser = FormularioUser()
    formularioFunc = FormularioFuncionario()
    if request.method=="GET":
            ERROR = False
            context = {'formularioUser':formularioUser, 'formularioFunc': formularioFunc, 'ERROR': ERROR}
            return render(request, 'form/crear_funcionario.html', context)

    elif request.method=="POST":
            print('RPOST:', request.POST['username'])
            #formulario_devueltoU, formulario_devueltoF = FormularioUser, FormularioFuncionario(request.POST)
            if request.POST['password'] != request.POST['passwordConfirm']:
                ERROR = True
                context = {'formularioUser':formularioUser, 'formularioFunc': formularioFunc, 'ERROR': ERROR}
                print('no se pudo crear el user')
                return render( request, 'form/crear_funcionario.html', context)
            else:
                try:
                    user_new = User.objects.create_user(
                        username = request.POST['username'],
                        email = request.POST['email'],
                        password = request.POST['password'],
                        is_staff = True,
                    )
                except:
                    ERROR = True
                    context = {'formularioUser':formularioUser, 'formularioFunc': formularioFunc, 'ERROR': ERROR}
                    print('no se pudo crear el user')
                    return render( request, 'form/crear_funcionario.html', context)
    
            try:
                funcionario = Funcionario.objects.create(
                    usuario = user_new,
                    nombre = request.POST['nombre'],
                    rol = request.POST['rol'],
                )
            except:
                ERROR = True
                context = {'formularioUser':formularioUser, 'formularioFunc': formularioFunc, 'ERROR': ERROR}
                print('no se pudo crear el funcionario')
                return render( request, 'form/crear_funcionario.html', context)
            return redirect('app1:inicio')


# C de CRUD
def crear_pacientes(request):
    formularioPaciente = FormularioPacientes()
    formularioUser = FormularioUser()
    if request.method=="GET":
        ERROR = False
        contex = {'formularioPaciente':formularioPaciente, 'formularioUser': formularioUser, 'ERROR': ERROR}
        return render(request, 'form/crear_pacientes.html', contex)

    elif request.method=="POST":
        #print ("llego POST OK", request.POST)

        if request.POST['password'] != request.POST['passwordConfirm']:
            ERROR = True
            contex = {'formularioPaciente':formularioPaciente, 'formularioUser': formularioUser, 'ERROR': ERROR}
            print('las contraseñas no coinciden')
            return render( request, 'form/crear_paciente.html', context)

        else:
            try:
                user_new = User.objects.create_user(
                    username = request.POST['username'],
                    email = request.POST['email'],
                    password = request.POST['password'],
                )
            except:
                ERROR = True
                contex = {'formularioPaciente':formularioPaciente, 'formularioUser': formularioUser, 'ERROR': ERROR}
                print('no se pudo crear el user')
                return render( request, 'form/crear_paciente.html', context)
        

        try:
            paciente = Pacientes.objects.create(
                usuario = user_new,
                rut=request.POST['rut'].replace('.', ''), 
                nombre=request.POST['nombre'],
                apellido=request.POST['apellido'],
                email=request.POST['email'],
                tutor=request.POST['tutor'],
                direccion=request.POST['direccion'],
                enfermedades=request.POST['enfermedades'],
                rol = request.POST['rol']
            )
            return redirect('form:pacientes_creados')
        except:
            ERROR = True
            contex = {'formularioPaciente':formularioPaciente, 'formularioUser': formularioUser, 'ERROR': ERROR}
            print('no se pudo crear el paciente')
            return render( request, 'form/crear_paciente.html', context)
    else:
        ERROR = True
        contex = {'formularioPaciente':formularioPaciente, 'formularioUser': formularioUser, 'ERROR': ERROR}
        print('algo muy raro paso')
        return render( request, 'form/crear_paciente.html', context)

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
                            enfermedades=datos_formulario['enfermedades'],
                            rol = datos_formulario['rol']
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
