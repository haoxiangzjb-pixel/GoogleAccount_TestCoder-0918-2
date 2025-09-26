from flask import Flask

app = Flask(__name__)

@app.route('/data')
def get_data():
    return {
        "message": "Hello from Flask!",
        "status": "success",
        "data": [1, 2, 3]
    }

if __name__ == '__main__':
    app.run(debug=True)