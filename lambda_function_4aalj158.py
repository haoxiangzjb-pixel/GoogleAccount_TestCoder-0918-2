def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function
    context (object): The context object passed to the Lambda function
    
    Returns:
    dict: A response object with a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'OK'
        }
    }
    
    return response

# Example usage (this would normally be triggered by AWS services)
if __name__ == "__main__":
    # Simulate a test event
    test_event = {}
    test_context = {}
    
    result = lambda_handler(test_event, test_context)
    print(result)