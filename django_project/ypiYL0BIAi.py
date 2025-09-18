from django.shortcuts import render

def my_template_view(request):
    # Sample context data
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
    }
    return render(request, 'my_template.html', context)