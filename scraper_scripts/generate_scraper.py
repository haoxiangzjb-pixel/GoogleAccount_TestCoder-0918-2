#!/usr/bin/env python3
"""
Script to generate a random filename and save our BeautifulSoup scraper to it
"""

import random
import string
import os
import shutil

def generate_random_filename(length=8):
    """Generate a random filename with .py extension"""
    chars = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(chars) for _ in range(length))
    return f"{random_name}.py"

def main():
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Define source and destination paths
    source_file = "/workspace/scraper_scripts/title_scraper_template.py"
    destination_file = f"/workspace/scraper_scripts/{random_filename}"
    
    # Copy the template to the new randomly named file
    try:
        shutil.copy2(source_file, destination_file)
        print(f"Successfully created scraper script with random name: {random_filename}")
        
        # Also create a simple instruction file
        instruction_file = "/workspace/scraper_scripts/README.md"
        with open(instruction_file, "w") as f:
            f.write("# Web Scraper for Page Titles\n\n")
            f.write("This directory contains a Python script that uses BeautifulSoup to scrape page titles from websites.\n\n")
            f.write(f"## Generated Script\n\nThe randomly generated script is: `{random_filename}`\n\n")
            f.write("## Usage\n\nRun the script with:\n\n```bash\npython3 {random_filename}\n```\n\n")
            f.write("The script will scrape titles from example URLs and save the results to a text file.\n")
        
        print(f"Created README.md with instructions")
        print(f"\nTo run the scraper:\n1. Navigate to the scraper_scripts directory: cd /workspace/scraper_scripts")
        print(f"2. Run the script: python3 {random_filename}")
        
    except Exception as e:
        print(f"Error creating file: {e}")

if __name__ == "__main__":
    main()