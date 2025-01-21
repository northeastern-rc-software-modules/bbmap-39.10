#!/bin/bash
#SBATCH -p short
#SBATCH --export=ALL
#SBATCH -N 1
#SBATCH -n 28
#SBATCH --exclusive
#SBATCH --job-name=bbmap_testcase_2
#SBATCH --output=output/testcase_2.txt

mkdir -p output src

echo "========================================================"
echo "Job Name: bbmap_testcase_2"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Node: $(hostname)"
echo "Start Time: $(date)"
echo "========================================================"

echo "Step 1: Creating test reference and reads"
echo ">ref_seq" > src/test_ref.fa
echo "ACGTACGTACGTACGTACGT" >> src/test_ref.fa
echo "@read1" > src/test_reads.fq
echo "ACGTACGTAC" >> src/test_reads.fq
echo "+" >> src/test_reads.fq
echo "IIIIIIIIII" >> src/test_reads.fq

echo "Step 2: Running BBMap alignment"
module load bbmap/39.11
bbmap.sh ref=src/test_ref.fa in=src/test_reads.fq out=output/aligned.sam

if [ $? -eq 0 ]; then
    echo "Step 2 Completed: Alignment successful"
else
    echo "Step 2 Failed: Alignment failed"
    exit 1
fi

echo "========================================================"
echo "Exiting Compute Node: $(hostname)"
echo "End Time: $(date)"
echo "========================================================"
