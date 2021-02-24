from django.shortcuts import render, redirect
from django.template import loader, context
from django.http import HttpResponse
from django.http import HttpResponsePermanentRedirect
from app1.forms import FormularioBusqueda, FormularioBusquedaLogin
from form.models import Pacientes, Examenes


# Create your views here.

def inicio(request):
    return render(request, 'app1/index.html')

def registro(request):
    return render(request, 'app1/register.html')

def fichaPaciente(request):
    return render(request, 'app1/fichapaciente.html')

def calendarioHoras(request):
    return render(request, 'app1/calendarioHoras.html')

def administracion(request):
    return render(request, 'app1/administracion.html')

def login(request):
    formulario = FormularioBusquedaLogin()
    if request.method == "GET":
        formulario = FormularioBusquedaLogin()
        context = {'formulario': formulario, 'invalid': False}
        return render(request, 'app1/login.html', context)

    elif request.method == "POST":
        formulario_devuelto = FormularioBusquedaLogin(request.POST)

        if formulario_devuelto.is_valid() == True:
            data = formulario_devuelto.cleaned_data
            
            if data['Rut'] == '19220125-k' and data['contra'] == '12345':
                return redirect('app1:fichaMedica')
            else:
                return render(request, 'app1/login.html', context)

        
    return render(request, 'app1/login.html')

def fichaMedica(request):
    formulario = FormularioBusqueda()
    if request.method == "GET":
        formulario = FormularioBusqueda()
        context = {'formulario': formulario, 'invalid': False}
        return render(request, 'app1/fichamedica.html', context)

    elif request.method == "POST":
        formulario_devuelto = FormularioBusqueda(request.POST)
        usuario_data = False
        lista2=[]
        datos=[]

        #print(formulario_devuelto)
        if formulario_devuelto.is_valid() == True:
            formulario_rut = formulario_devuelto.cleaned_data
            #print(formulario_rut, '########################################')
            usuario_data = verificar_user(formulario_rut)

        if usuario_data != False:
            lista_examenes = contex_examenes_paciente(usuario_data['rut'])
            '''
            lista_examenes2 = []
            for i in range (0,len(lista_examenes['lista_examenes'])):
                lista2.append(lista_examenes['lista_examenes'][i]['rut'])


            #creamos una nueva lista de examenes solo con el rut solicitado
            rut = str(usuario_data['rut'])
            for i in range (0, len(lista2)):
                lista_examenes2.append(lista2[i].get(rut))
            print(len(lista_examenes2))


            #sacamos los elementos none ligados a otros rut
            for elemento in lista_examenes2:
                if elemento == None:
                    print("elemento none")
                else:
                    datos.append(elemento)
            '''
            examen_filtrado = {'colesterol':[],'triglicerido':[],'orina': [],'glucosa':[],'bilirrubina':[], 'fecha':[]}
            for elemento in lista_examenes:   
                examen_filtrado['colesterol'].append(elemento['colesterol'])
                examen_filtrado['triglicerido'].append(elemento['triglicerido'])
                examen_filtrado['orina'].append(elemento['orina'])
                examen_filtrado['glucosa'].append(elemento['glucosa'])
                examen_filtrado['bilirrubina'].append(elemento['bilirrubina'])
                examen_filtrado['fecha'].append(elemento['fecha'])
            print(examen_filtrado['fecha'])
            context = {'usuario': usuario_data, 'lista_examenes': lista_examenes, 'resultados':examen_filtrado}
            return render(request, 'app1/fichapaciente.html', context)
        elif formulario_devuelto.is_valid() == False:
            formulario = FormularioBusqueda()
            context = {'formulario': formulario, 'invalid': True}
            return render(request, 'app1/fichamedica.html', context)
        else:
            formulario = FormularioBusqueda()
            context = {'formulario': formulario, 'invalid': True}
            return render(request, 'app1/fichamedica.html', context)
    else:
        formulario = FormularioBusqueda()
        context = {'formulario': formulario, 'invalid': True}
        return render(request, 'app1/fichamedica.html', context)

def context_lista_pacientes():
    pass

def lista_pacientes(request):
    context = context_lista_pacientes()
    return render(request, 'app1/fichapaciente.html', context)

def verificar_user(rut):
    print("Esta es la información que tiene RUT", rut['Rut'])
    aux= rut['Rut']
    paciente = Pacientes.objects.filter(rut=aux).values()[0]
    print("Esta es la información que tiene Pacientes", paciente)
    return paciente

def contex_examenes_paciente(rut):
    examenes = Examenes.objects.filter(paciente = rut).values()
    print("Los valores de:", examenes)
    return examenes