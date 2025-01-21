#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bbmap_testcase_4
#SBATCH --output=output/testcase_4.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bbmap_testcase_4"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Testing low-memory mode"
module load bbmap/39.11
bbmap.sh ref=src/test_ref.fa in=src/test_reads.fq out=output/low_mem.sam usemodulo=t

if [ $? -eq 0 ]; then
    echo "Step 1 Completed: Low-memory mode test successful"
else
    echo "Step 1 Failed: Low-memory mode test failed"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"

