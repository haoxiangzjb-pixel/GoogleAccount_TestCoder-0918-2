from flask import Flask, jsonify
import uuid
import os

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    data = {
        'id': str(uuid.uuid4()),
        'message': 'Hello, World!',
        'status': 'success',
        'items': ['item1', 'item2', 'item3']
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Flask app is running!'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)