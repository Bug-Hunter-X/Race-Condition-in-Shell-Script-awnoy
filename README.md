# Race Condition Bug in Shell Script

This repository demonstrates a race condition bug in a shell script.  Two processes concurrently write to a file without any synchronization mechanisms, resulting in unpredictable output.

## Bug Description
The script creates a temporary file and uses two processes to write lines to it simultaneously. Due to the lack of any locking or other synchronization, the order of the lines in the file is non-deterministic and may be incomplete, demonstrating a race condition.

## Solution
The solution demonstrates a fix using a lock file to coordinate access to the shared resource. This prevents the processes from writing concurrently. 

## How to run

1. Clone the repository.
2. Navigate to the repository's directory.
3. Run the buggy script `./bug.sh`.
4. Run the fixed script `./bugSolution.sh`.

Observe the difference in output to understand the impact of the race condition and the effectiveness of the solution.