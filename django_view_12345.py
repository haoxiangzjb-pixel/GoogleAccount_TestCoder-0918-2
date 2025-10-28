from django.shortcuts import render
from django.http import HttpResponse

def sample_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Hello from the Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)

# Alternative view example with conditional logic
def conditional_template_view(request):
    """
    A Django view with conditional template rendering.
    """
    import random
    
    context = {
        'random_number': random.randint(1, 100),
        'user_authenticated': request.user.is_authenticated if hasattr(request, 'user') else False
    }
    
    template_name = 'authenticated_template.html' if context['user_authenticated'] else 'guest_template.html'
    
    return render(request, template_name, context)