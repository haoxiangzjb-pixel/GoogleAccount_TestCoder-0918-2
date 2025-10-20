from django.shortcuts import render
from django.http import HttpResponse


def sample_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)


def simple_view(request):
    """
    A simple view that returns an HttpResponse.
    """
    return HttpResponse("Hello, this is a simple Django view!")