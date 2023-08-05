from django.shortcuts import render,redirect,HttpResponse
from django.core.files.storage import FileSystemStorage
from .models import filepath


# Create your views here.
def Image_upload(request):
        if request.method == "POST":
            myfile = request.FILES['myfile']
            print(myfile)
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            uploaded_file_url = fs.url(filename)
            print(uploaded_file_url)
            Path = filepath(path=uploaded_file_url)
            Path.save()
            return render(request,'Upload_image/index.html')

        else:
            return render(request,'Upload_image/index.html')

def View_uploads(request):
            Path=filepath.objects.all()
            return render(request,'Upload_image/upload_view.html',{"path":Path})