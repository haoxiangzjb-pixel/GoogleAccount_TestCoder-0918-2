from django.shortcuts import render

def index(request):
    context = {
        'message': 'Hello from Django!'
    }
    return render(request, 'index.html', context)
