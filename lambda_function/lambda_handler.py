import json
import random
import string


def lambda_handler(event, context):
    # Generate a random success message
    random_suffix = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
    message = f"Success! Function executed successfully - {random_suffix}"
    
    # Return the response
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': message,
            'event': event,
            'context': str(context)
        })
    }