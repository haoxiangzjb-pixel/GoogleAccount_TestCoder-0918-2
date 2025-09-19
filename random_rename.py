import random
import string
import os

# Generate a random filename with .m extension
random_name = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.m'
print(f"Random filename: {random_name}")

# Rename the sine wave plot file
os.rename('/workspace/sine_wave_plot.m', f'/workspace/{random_name}')
print(f"File successfully renamed to: {random_name}")