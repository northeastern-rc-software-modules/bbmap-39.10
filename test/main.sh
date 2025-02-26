#!/bin/bash

echo "Starting BBMap/39.11 module test cases..."

# Create directories if they don't exist
mkdir -p output src

# Submit all test cases
echo "Submitting test case 1 - Module loading test"
sbatch testcase1_bbmap.sh

echo "Submitting test case 2 - Basic read alignment test"
sbatch testcase2_bbmap.sh

echo "Submitting test case 3 - Quality control test"
sbatch testcase3_bbmap.sh

echo "Submitting test case 4 - Memory usage test"
sbatch testcase4_bbmap.sh

echo "All test cases submitted. Check output directory for results."
