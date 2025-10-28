import uuid

def generate_hello_file():
    filename = f'hello_world_{uuid.uuid4().hex}.py'
    content = '''def hello():
    print("Привет, мир!")

if __name__ == "__main__":
    hello()
'''
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"File created: {filename}")

if __name__ == "__main__":
    generate_hello_file()