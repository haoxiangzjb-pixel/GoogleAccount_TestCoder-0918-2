from django.shortcuts import render

def my_view(request):
    context = {
        'title': 'My Django View',
        'message': 'Hello from the Django view!'
    }
    return render(request, 'my_template.html', context)