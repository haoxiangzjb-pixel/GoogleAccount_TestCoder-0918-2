from flask import Flask
import psycopg2
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # Attempt to connect to the database
    try:
        db_url = os.environ.get('DATABASE_URL')
        conn = psycopg2.connect(db_url)
        conn.close()
        return 'Hello, World! Successfully connected to the database.'
    except Exception as e:
        return f'Hello, World! Failed to connect to the database: {e}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)