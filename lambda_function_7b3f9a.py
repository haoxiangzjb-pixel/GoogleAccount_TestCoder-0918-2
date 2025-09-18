import json
import random
import string


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event (dict): AWS Lambda event object
        context (object): AWS Lambda context object
        
    Returns:
        dict: Response with status code and success message
    """
    
    # Generate a random request ID for demonstration
    request_id = ''.join(random.choices(string.ascii_letters + string.digits, k=12))
    
    # Success message
    message = "Operation completed successfully!"
    
    # Log the request ID (visible in CloudWatch logs)
    print(f"Request ID: {request_id} - {message}")
    
    # Return success response
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': message,
            'requestId': request_id,
            'status': 'SUCCESS'
        })
    }


# For local testing
if __name__ == "__main__":
    # Simulate a Lambda event and context
    test_event = {}
    test_context = type('obj', (object,), {'aws_request_id': 'test-request-id'})
    
    # Call the function
    result = lambda_handler(test_event, test_context)
    
    # Print the result
    print(json.dumps(result, indent=2))