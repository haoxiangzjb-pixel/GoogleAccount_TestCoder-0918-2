from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello, this is your JSON data!",
        "status": "success",
        "data": {
            "item1": "value1",
            "item2": 42,
            "item3": [1, 2, 3]
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)