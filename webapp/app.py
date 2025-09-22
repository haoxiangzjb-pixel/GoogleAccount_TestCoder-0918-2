from flask import Flask
import psycopg2
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # Простая проверка подключения к БД
    try:
        conn = psycopg2.connect(os.environ['DATABASE_URL'])
        conn.close()
        return "Hello, World! Connected to DB."
    except Exception as e:
        return f"Hello, World! DB Connection failed: {e}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)