import random
import string

# Generate a random filename with .graphql extension
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.graphql'
print(filename)