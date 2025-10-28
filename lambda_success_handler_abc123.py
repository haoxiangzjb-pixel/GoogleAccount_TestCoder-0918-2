import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event: The event object containing information about the request
        context: The context object containing runtime information
        
    Returns:
        dict: A response object with statusCode and body
    """
    # Create a success response
    response = {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "message": "Success! Lambda function executed successfully.",
            "status": "ok"
        })
    }
    
    return response


# Example usage (this would be triggered by AWS, not run directly)
if __name__ == "__main__":
    # Simulate a test event
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    result = lambda_handler(test_event, test_context)
    print(result)