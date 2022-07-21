#!/bin/bash

#SBATCH --partition prod
#SBATCH --job-name=02_smrnaseq_pipeline_run
#SBATCH --time=12:00:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH --mem 130G
#SBATCH --output="./logs/illumina_smallRNAseq/jejunum_sncrna/slurm-%j-%x.out"

# configure project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements"

# set the shell to be used by conda for this script (and re-start shell to implement changes)
echo ""
echo "Configuring conda"
echo ""

conda init bash
source ~/.bashrc

# create conda environment with nextflow installed and activate it
echo ""
echo "Creating conda environment with nextflow installed"
echo ""

mamba env create --force -f $project_dir/scripts/envs/conda.nextflow.22.04.0_jejunum.yml
conda activate jejunum_smrnaseq_pipeline

# run smrnaseq pipeline
echo ""
echo "Running smrnaseq pipeline"
echo ""

nextflow -log $project_dir/logs/illumina_smallRNAseq/jejunum_sncrna/smrnaseq_pipeline_run.log run nf-core/smrnaseq \
-r 2.0.0 \
-profile singularity \
-with-report \
-with-timeline \
-with-trace \
-with-dag \
-work-dir $project_dir/tmp/jejunum_smrnaseq/ \
--input $project_dir/config/illumina_smallRNAseq/jejunum_sncrna/smrnaseq_samplesheet.csv \
--outdir $project_dir/results/illumina_smallRNAseq/jejunum_sncrna/smrnaseq_pipeline_run/ \
--protocol illumina \
--mirtrace_protocol illumina \
--genome GRCh38 \
--mirtrace_species hsa \
--min_length 17
