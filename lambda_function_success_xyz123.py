def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A dictionary containing the success message and status code
    """
    return {
        'statusCode': 200,
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'ok'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }


# Example usage (optional):
if __name__ == "__main__":
    # Simulate a Lambda invocation
    result = lambda_handler({}, {})
    print(result)