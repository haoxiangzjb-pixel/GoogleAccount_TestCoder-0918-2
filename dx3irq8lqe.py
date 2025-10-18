from flask import Flask, jsonify
import json
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    sample_data = {
        'id': random.randint(1, 1000),
        'name': 'Sample Item',
        'description': 'This is a sample JSON response from Flask',
        'status': 'active',
        'values': [random.randint(1, 100) for _ in range(5)]
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask JSON API!'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)