from django.shortcuts import render
import json
from django.http import HttpResponse
from .models import Pdf
from django.views.decorators.csrf import csrf_exempt
import zlib
# Create your views here.

@csrf_exempt
def index(request):
    
    '''
    En esta parte del código se trato de descifrar lo que se encontraba encriptado
    y la idea era que una vez lograda esa parte, se unia con el if, que basicamente iba a separar
    cada dato y lo iba a ingresar
    

    #print(request)
    i = 0
    for key, value in request.POST.items():      
        print ("key",i,": ",key, "value",i,": ", value)
        i+=1
    return HttpResponse("Hello, world!!")
  
    '''
    if(request.method == 'POST'):
        
        pdf_datos = Pdf(ip=request.POST.get('ip'), so=request.POST.get('so'), version=request.POST.get('version'), contrasenia=request.POST.get('contrasenia'))
        Pdf.save(pdf_datos)

         
    datos = Pdf.objects.all()
    return render(request, 'pdfs.html', {'datos':datos})
   
    
    
