from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A simple Django view that renders a template.
    """
    context = {
        'title': 'My Django View',
        'message': 'Hello from the Django view!'
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that returns a simple HttpResponse.
    """
    return HttpResponse("This is another view.")