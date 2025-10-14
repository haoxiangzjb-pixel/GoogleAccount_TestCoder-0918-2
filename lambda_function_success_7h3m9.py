def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Lambda function executed successfully!'
    }

# Example event and context for local testing (optional)
if __name__ == "__main__":
    # Example invocation
    test_event = {}
    test_context = type('Context', (object,), {
        'function_name': 'test',
        'memory_limit_in_mb': 128,
        'invoked_function_arn': 'arn:aws:lambda:us-east-1:123456789012:function:test',
        'aws_request_id': '12345678901234567890123456789012'
    })()

    response = lambda_handler(test_event, test_context)
    print(response)
