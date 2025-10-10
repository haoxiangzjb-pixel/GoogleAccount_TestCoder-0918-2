from django.shortcuts import render

def my_template_view(request):
    """
    A simple Django view that renders a template.
    """
    context = {
        # You can add variables here to pass to the template
    }
    return render(request, 'my_template.html', context)