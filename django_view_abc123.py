from django.shortcuts import render
from django.http import HttpResponse


def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'sample_template.html', context)


def another_view(request):
    """
    Another example view with different context.
    """
    context = {
        'page_title': 'About Us',
        'content': 'This is the about page of our website.'
    }
    
    return render(request, 'about_template.html', context)