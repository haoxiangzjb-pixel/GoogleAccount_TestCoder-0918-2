import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event: The event object passed to the Lambda function
    context: The context object passed to the Lambda function
    
    Returns:
    dict: A response object with a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        }),
        'headers': {
            'Content-Type': 'application/json',
        }
    }
    
    return response