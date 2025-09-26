def lambda_handler(event, context):
    """
    AWS Lambda function handler that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Function executed successfully!'
    }

# Example usage (this part is typically not used in Lambda service execution,
# but can be helpful for local testing):
# if __name__ == "__main__":
#     print(lambda_handler({}, {}))