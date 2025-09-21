import random
import string
from flask import Flask, jsonify

# Generate a random string for the filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.py"

# Create Flask app
app = Flask(__name__)

# Define a route that returns JSON data
@app.route('/api/data')
def get_data():
    sample_data = {
        "message": "Hello, World!",
        "status": "success",
        "data": [
            {"id": 1, "name": "Item 1"},
            {"id": 2, "name": "Item 2"},
            {"id": 3, "name": "Item 3"}
        ]
    }
    return jsonify(sample_data)

# Another route returning different JSON data
@app.route('/api/status')
def get_status():
    status_data = {
        "application": "Flask JSON API",
        "version": "1.0",
        "status": "running"
    }
    return jsonify(status_data)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')