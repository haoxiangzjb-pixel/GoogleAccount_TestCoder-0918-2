def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A dictionary containing the HTTP response
    """
    # Return a success message
    return {
        'statusCode': 200,
        'body': 'Success: Lambda function executed successfully!',
        'headers': {
            'Content-Type': 'text/plain'
        }
    }


# Example usage (this would typically be handled by AWS Lambda runtime)
if __name__ == "__main__":
    # Simulate an event and context
    test_event = {}
    test_context = type('Context', (object,), {
        'function_name': 'test_lambda',
        'memory_limit_in_mb': 128,
        'invoked_function_arn': 'arn:aws:lambda:us-east-1:123456789012:function:test'
    })()
    
    result = lambda_handler(test_event, test_context)
    print(result)