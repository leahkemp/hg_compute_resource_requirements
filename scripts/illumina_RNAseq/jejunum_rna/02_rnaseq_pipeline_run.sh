#!/bin/bash

#SBATCH --partition prod
#SBATCH --job-name=02_rnaseq_pipeline_run
#SBATCH --time=12:00:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH --mem 130G
#SBATCH --output="./logs/illumina_RNAseq/jejunum_rna/slurm-%j-%x.out"

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

mamba env create --force -f $project_dir/scripts/envs/conda.nextflow.22.04.0_jejunum_rna.yml
conda activate jejunum_rnaseq_pipeline

# run rnaseq pipeline
echo ""
echo "Running rnaseq pipeline"
echo ""

nextflow -log $project_dir/logs/illumina_RNAseq/jejunum_rna/rnaseq_pipeline_run.log run nf-core/rnaseq \
-r 3.7 \
-profile singularity \
-with-report \
-with-timeline \
-with-trace \
-with-dag \
-work-dir $project_dir/tmp/jejunum_rnaseq/ \
--input $project_dir/config/illumina_RNAseq/jejunum_rna/rnaseq_samplesheet.csv \
--outdir $project_dir/results/illumina_RNAseq/jejunum_rna/rnaseq_pipeline_run/ \
--genome GRCh38 \
--remove_ribo_rna \
--save_non_ribo_reads \
--min_trimmed_reads 10000 \
--aligner star_salmon \
--min_mapped_reads 5
