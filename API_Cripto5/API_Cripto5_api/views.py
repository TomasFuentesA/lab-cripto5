from django.shortcuts import render
from django.http import HttpResponse
from .models import Pdf
from django.views.decorators.csrf import csrf_exempt
# Create your views here.

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

@csrf_exempt
def index(request):
    
    '''
    En esta parte del código se trato de descifrar lo que se encontraba encriptado
    y la idea era que una vez lograda esa parte, se unia con el if, quie iba descifrar
    aquellos datos de importancia como la contraseña y lo añadiria
    '''
    
    so_c = request.user_agent.os.family
    ver_c = request.user_agent.os.version_string
    print(so_c, ver_c)
        
    ip_c = get_client_ip(request)
    i = 0
    for key, value in request.POST.items():      
        print ("key",i,": ",key, "value",i,": ", value)
        i+=1
  

    if(request.method == 'POST'):
        
        pdf_datos = Pdf(ip=ip_c, so=so_c, version=ver_c, contrasenia="contrasenia")
        Pdf.save(pdf_datos)

         
    datos = Pdf.objects.all()
    return render(request, 'pdfs.html', {'datos':datos})
    
    
