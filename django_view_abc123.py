from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    # Context data to pass to the template
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view with more complex logic
def detail_view(request, item_id):
    """
    A Django view with parameters that renders a template
    """
    # Simulate fetching data based on item_id
    item_data = {
        'id': item_id,
        'name': f'Item {item_id}',
        'description': f'Description for item {item_id}'
    }
    
    context = {
        'item': item_data,
        'title': f'Item Details - {item_data["name"]}'
    }
    
    return render(request, 'detail_template.html', context)