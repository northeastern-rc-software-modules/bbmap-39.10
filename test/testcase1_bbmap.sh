#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bbmap_testcase_1
#SBATCH --output=output/testcase_1.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bbmap_testcase_1"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Loading BBMap module and verifying version"
module load bbmap/39.11
bbmap.sh --version &> /dev/null

if [ $? -eq 0 ]; then
    echo "Step 1 Completed: BBMap module loaded successfully."
    echo "BBMap Version:"
    bbmap.sh --version
else
    echo "Step 1 Failed: Unable to load BBMap module."
    echo "End Time: $(date)"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"
