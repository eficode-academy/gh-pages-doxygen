#!/bin/bash

# Number of folders
num_folders=10

# Number of files per folder
files_per_folder=100

# Size of each file in KB
file_size=100

# Create a base directory to hold all the folders
base_dir="base"
mkdir -p "$base_dir"

# Loop to create folders
for (( folder=1; folder<=num_folders; folder++ ))
do
    # Create folder
    folder_name="${base_dir}/folder_${folder}"
    mkdir -p "$folder_name"

    # Loop to create files in each folder
    for (( file=1; file<=files_per_folder; file++ ))
    do
        file_name="${folder_name}/file_${file}.txt"
        
        # Create a file of the specified size
        # Using 'head -c' to get the first 100KB of /dev/urandom
        head -c "${file_size}K" /dev/urandom > "$file_name"
    done
done

echo "Files created successfully."
