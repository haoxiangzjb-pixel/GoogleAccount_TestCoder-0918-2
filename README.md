# Pandas DataFrame Filter and Save Script

This project contains a Python script that demonstrates how to:
1. Create and filter a Pandas DataFrame
2. Save the filtered DataFrame to a randomly named .py file
3. The generated file can be executed independently to recreate the filtered DataFrame

## Files

- `filter_script.py`: Main script that creates a sample DataFrame, filters it, and saves the result to a randomly named .py file
- `filtered_data_[random_name].py`: Generated files containing the filtered DataFrame data

## How It Works

1. The script creates a sample DataFrame with Name, Age, City, and Salary columns
2. It filters the DataFrame to include only people older than 29
3. It generates a random filename in the format `filtered_data_[8_random_characters].py`
4. It saves the filtered DataFrame as a dictionary in the generated Python file
5. The generated file can be run independently to recreate and display the filtered DataFrame

## Usage

Run the main script:
```bash
python filter_script.py
```

This will create a new randomly named .py file in the workspace.