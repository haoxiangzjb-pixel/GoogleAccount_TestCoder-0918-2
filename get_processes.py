import psutil
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.txt'

# Get the list of processes
processes = psutil.process_iter()

# Write the process information to the file
with open(random_filename, 'w') as f:
    for process in processes:
        try:
            f.write(f"PID: {process.pid}, Name: {process.name()}, Status: {process.status()}\n")
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            # Handle cases where the process might have terminated or access is denied
            pass

print(f"Process list saved to {random_filename}")