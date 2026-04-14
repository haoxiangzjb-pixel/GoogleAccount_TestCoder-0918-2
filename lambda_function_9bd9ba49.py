def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event: The event data passed to the Lambda function
        context: The runtime information provided by Lambda
    
    Returns:
        dict: A response containing a success message
    """
    return {
        "statusCode": 200,
        "body": "Success! Lambda function executed successfully."
    }
