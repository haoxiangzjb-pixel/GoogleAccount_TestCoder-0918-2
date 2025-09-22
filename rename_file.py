import random
import string
import os

# Generate random name
random_name = ''.join(random.choices(string.ascii_letters, k=10)) + ".py"

# Rename the file
os.rename("/workspace/create_sqlite_table.py", f"/workspace/{random_name}")

print(f"File renamed to: {random_name}")