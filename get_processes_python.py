import subprocess
import sys
import os

def get_processes_and_save(output_file):
    """Gets the list of processes using 'ps' and saves it to a file."""
    try:
        # Run the 'ps' command to get process list
        result = subprocess.run(['ps', 'aux'], capture_output=True, text=True, check=True)

        # Write the output to the specified file
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(result.stdout)

        print(f"Process list saved to {output_file}")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while running 'ps': {e}")
        sys.exit(1)
    except FileNotFoundError:
        print(f"Error: Could not create file {output_file}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python get_processes_python.py <output_file>")
        sys.exit(1)

    output_file = sys.argv[1]
    get_processes_and_save(output_file)