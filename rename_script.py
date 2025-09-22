import random
import string
import os

# Generate random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
print(f"Random filename: {random_name}")

# Rename the file
os.rename('/workspace/mysql_query_script.py', f'/workspace/{random_name}')
print(f"File successfully renamed to: {random_name}")