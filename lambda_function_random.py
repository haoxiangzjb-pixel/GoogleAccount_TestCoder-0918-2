import json
import random
import string

def lambda_handler(event, context):
    # Generate a random success message
    random_suffix = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
    message = f"Success! Operation completed successfully - {random_suffix}"
    
    # Return a properly formatted Lambda response
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': message,
            'status': 'success'
        })
    }