from flask import Flask, jsonify
import uuid

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

if __name__ == '__main__':
    app.run(debug=True)