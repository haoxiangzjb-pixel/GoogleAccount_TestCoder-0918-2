import psutil
import random
import csv

# Generate a random filename
random_filename = f"processes_{random.randint(1, 10000)}.csv"

# Get the list of processes
processes = []
for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
    try:
        # Get process info as a dictionary
        proc_info = proc.info
        processes.append(proc_info)
    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        # Handle processes that might have terminated or are inaccessible
        pass

# Write the process list to the randomly named CSV file
if processes:
    with open(random_filename, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.DictWriter(file, fieldnames=['pid', 'name', 'username', 'status'])
        writer.writeheader()
        writer.writerows(processes)

print(f"Process list exported to {random_filename}")