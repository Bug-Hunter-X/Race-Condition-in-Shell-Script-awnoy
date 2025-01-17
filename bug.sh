#!/bin/bash

# This script demonstrates a race condition bug.

# Create a temporary file
tmpfile=$(mktemp)

# Function to write to the temporary file
write_to_file() {
  echo "$1" >> "$tmpfile"
}

# Function to read from the temporary file
read_from_file() {
  cat "$tmpfile"
}

# Create two processes that concurrently write to the file
write_to_file "Process 1: Line 1"
write_to_file "Process 2: Line 1" &

# Read the content of the file after writing
read_from_file

# Clean up
rm "$tmpfile"