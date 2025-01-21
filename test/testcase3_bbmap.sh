#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bbmap_testcase_3
#SBATCH --output=output/testcase_3.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bbmap_testcase_3"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Creating test data with quality scores"
echo "@read1" > src/qc_test.fq
echo "ACGTACGTAC" >> src/qc_test.fq
echo "+" >> src/qc_test.fq
echo "IIIIIIIIII" >> src/qc_test.fq

echo "Step 2: Running quality statistics"
module load bbmap/39.11
stats.sh in=src/qc_test.fq out=output/qc_stats.txt

if [ $? -eq 0 ]; then
    echo "Step 2 Completed: Quality control analysis successful"
else
    echo "Step 2 Failed: Quality control analysis failed"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"
