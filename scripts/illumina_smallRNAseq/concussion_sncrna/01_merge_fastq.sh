#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=00:30:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --job-name="merge_fastq"
#SBATCH --output="./logs/illumina_smallRNAseq/concussion_sncrna/slurm-%j-%x.out"

# configure file paths
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements"
tmp_dir="/NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/tmp"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $tmp_dir/staging
rm -rf $project_dir/fastq/concussion_sncrna

# make directories to be used if it doesn't yet exist
mkdir -p $tmp_dir/staging
mkdir -p $project_dir/fastq/concussion_sncrna

# move files to a staging location to be renamed
echo ""
echo "Copying fastq's to staging location"
echo ""
cp $project_dir/fastq_raw/concussion_sncrna/*.fastq.gz $project_dir/tmp/staging/

# rename files before merge so there is only sample, lane and read info in the filenames
echo ""
echo "Renaming fastq files"
echo ""

for file in $tmp_dir/staging/*.fastq.gz ; do mv "$file" "$(echo "$file" | sed -r 's/[A-Z0-9]{9}_[A/G/T/C]{8}_//')" ; done

# merge files with the same sample name
echo ""
echo "Merge fastq files"
echo ""

for sample in $(find $tmp_dir/staging/ -type f -name "*.fastq.gz" | while read F; do basename $F | rev | cut -c 18- | rev; done | sort | uniq); do

    echo ""
    echo "Merging R1 for sample:"
    echo $sample
    echo ""
    
    cat "$tmp_dir/staging/$sample"_L00*_R1.fastq.gz > $project_dir/fastq/concussion_sncrna/"$sample".fastq.gz

done;

# remove the staging files
echo ""
echo "Cleaning up"
echo ""

rm -rf $tmp_dir/staging/

rm -rf $project_dir/fastq_raw/concussion_sncrna
