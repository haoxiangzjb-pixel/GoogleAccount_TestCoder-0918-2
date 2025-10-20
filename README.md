# Process List Scripts

This directory contains scripts to get a list of processes and save them to a file with a random name.

## PowerShell Script (Reference)

The original request was for a PowerShell script, which would look like this:

```powershell
# PowerShell script to get a list of processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename
$randomName = [System.IO.Path]::GetRandomFileName() + ".txt"
$outputFile = Join-Path -Path $PWD -ChildPath $randomName

# Export the processes to the file
$processes | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host "Process list saved to: $outputFile"
```

## Bash Script (Working Solution)

Since PowerShell is not available in this environment, I created an equivalent Bash script:

```bash
#!/bin/bash

# Script to get a list of processes and save to a file with a random name

# Get the list of processes
processes=$(ps aux)

# Generate a random filename
random_name=$(mktemp --suffix=.txt)

# Save the processes to the file
echo "$processes" > "$random_name"

echo "Process list saved to: $random_name"
```

The Bash script successfully retrieves the process list using `ps aux` and saves it to a file with a random name in the `/tmp` directory.