import psutil
import random
import string
import csv

def generate_random_filename(extension="csv"):
    """Generate a random filename with the given extension."""
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"processes_{random_part}.{extension}"

def get_processes_and_save():
    """Get list of processes and save to a file with random name."""
    # Generate random filename
    filename = generate_random_filename("csv")
    
    # Get list of processes
    processes = []
    for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
        try:
            processes.append(proc.info)
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            # Handle processes that might have disappeared or access denied
            pass
    
    # Save to CSV file
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        if processes:
            fieldnames = processes[0].keys()
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            
            writer.writeheader()
            for proc in processes:
                writer.writerow(proc)
    
    print(f"Process list saved to {filename}")
    return filename

if __name__ == "__main__":
    get_processes_and_save()