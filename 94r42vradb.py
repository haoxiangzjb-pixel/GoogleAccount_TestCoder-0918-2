import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object with statusCode and body
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success!',
            'status': 'completed'
        }),
        'headers': {
            'Content-Type': 'application/json',
        }
    }
    
    return response


# Example usage (optional)
if __name__ == "__main__":
    # Simulate a Lambda invocation
    result = lambda_handler({}, None)
    print(result)