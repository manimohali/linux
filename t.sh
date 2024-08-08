#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/home/ri-13/Downloads"
DEST_DIR="/home/ri-13/Downloads/lab/logs"

# Create the destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Loop through each gzip file in the source directory
for file in "$SOURCE_DIR"/access.log.*.gz; do
  if [ -f "$file" ]; then
    # Print the name of the file
    echo "Processing $file"
    
    # Extract the file and move it to the destination directory
    gunzip -c "$file" > "$DEST_DIR"/$(basename "${file%.gz}")
  else
    echo "No files found matching $SOURCE_DIR/access.log.*.gz"
  fi
done

