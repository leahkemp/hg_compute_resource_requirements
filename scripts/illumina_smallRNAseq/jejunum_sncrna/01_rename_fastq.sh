#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=00:30:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --job-name="01_merge_fastq"
#SBATCH --output="./logs/illumina_smallRNAseq/jejunum_sncrna/slurm-%j-%x.out"

# configure file paths
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements"
tmp_dir="/NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/tmp"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $tmp_dir/staging
rm -rf $project_dir/fastq/jejunum_sncrna

# make directories to be used if it doesn't yet exist
mkdir -p $tmp_dir/staging
mkdir -p $project_dir/fastq/jejunum_sncrna

# move files to a staging location to be renamed
echo ""
echo "Copying fastq's to staging location"
echo ""
cp $project_dir/fastq_raw/jejunum_sncrna/*.fastq.gz $project_dir/tmp/staging/

# rename files before merge so there is only sample and read info in the filenames
echo ""
echo "Renaming fastq files"
echo ""

for file in $tmp_dir/staging/*.fastq.gz ; do mv "$file" "$(echo "$file" | sed -r 's/_[A-Z0-9]{9}_[A/G/T/C]{6}_L00[1-2]_R[1-2]//')" ; done

# move to fastq dir
mv $tmp_dir/staging/* $project_dir/fastq/jejunum_sncrna/

# remove the staging files
echo ""
echo "Cleaning up"
echo ""

rm -rf $tmp_dir/staging/

rm -rf $project_dir/fastq_raw/jejunum_sncrna
