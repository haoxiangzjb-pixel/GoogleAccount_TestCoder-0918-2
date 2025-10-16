from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)

# Alternative view example with conditional logic
def conditional_view(request):
    """
    A Django view with conditional rendering logic.
    """
    user_authenticated = request.user.is_authenticated
    
    context = {
        'is_authenticated': user_authenticated,
        'page_title': 'Conditional Page'
    }
    
    if user_authenticated:
        context['message'] = 'Welcome back, authenticated user!'
    else:
        context['message'] = 'Please log in to access more features.'
    
    return render(request, 'conditional_template.html', context)