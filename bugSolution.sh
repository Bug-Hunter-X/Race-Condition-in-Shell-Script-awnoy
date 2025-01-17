#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

# Create a temporary file
tmpfile=$(mktemp)
lockfile="$tmpfile.lock"

# Function to write to the temporary file with locking
write_to_file() {
  flock "$lockfile" 
  echo "$1" >> "$tmpfile"
  flock -u "$lockfile"
}

# Function to read from the temporary file
read_from_file() {
  cat "$tmpfile"
}

# Create two processes that concurrently write to the file
write_to_file "Process 1: Line 1"
write_to_file "Process 2: Line 1" &

# Wait for the background process to finish
wait

# Read the content of the file after writing
read_from_file

# Clean up
rm "$tmpfile" "$lockfile"