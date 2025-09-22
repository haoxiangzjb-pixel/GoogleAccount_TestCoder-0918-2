from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Hello from Django!',
        'items': ['apple', 'banana', 'orange']
    }
    return render(request, 'sample_template.html', context)

def another_view(request):
    """
    Another Django view example
    """
    return HttpResponse("This is another view without a template")