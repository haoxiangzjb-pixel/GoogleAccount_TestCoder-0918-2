import random
import string
import os

# Create a table (list of dictionaries) to store student grades
student_grades = [
    {"name": "Alice", "grade": 85},
    {"name": "Bob", "grade": 92},
    {"name": "Charlie", "grade": 78},
    {"name": "Diana", "grade": 96},
    {"name": "Eve", "grade": 88}
]

# Function to calculate average grade
def calculate_average(grades):
    if len(grades) == 0:
        return 0
    total = sum(student["grade"] for student in grades)
    return total / len(grades)

# Calculate the average
average_grade = calculate_average(student_grades)

# Print the results
print("Student Grades:")
for i, student in enumerate(student_grades, 1):
    print(f"{i}. {student['name']}: {student['grade']}")

print(f"\nAverage Grade: {average_grade:.2f}")

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
filename = f"{random_name}.lua"

# Write the table and average to the file in Lua format
with open(filename, "w") as file:
    file.write("-- Student grades table and average\n")
    file.write("local student_grades = {\n")
    for student in student_grades:
        file.write(f'    {{name = "{student["name"]}", grade = {student["grade"]}}},\n')
    file.write("}\n\n")
    file.write(f"local average_grade = {average_grade}\n")
    file.write("return {grades = student_grades, average = average_grade}\n")

print(f"\nData saved to: {filename}")