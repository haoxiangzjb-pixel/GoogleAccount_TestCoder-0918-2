from django.shortcuts import render
from django.http import HttpResponse


def sample_template_view(request):
    """
    A Django view that renders a template with context data.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)


def another_view(request):
    """
    Another example view that could be used in your Django app.
    """
    return HttpResponse("This is a simple response from another view.")