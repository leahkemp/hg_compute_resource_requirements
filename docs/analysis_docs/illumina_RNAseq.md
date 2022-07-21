# Illumina RNAseq

Created: 2022/07/20 16:07:39
Last modified: 2022/07/21 15:41:09

- **Aim:** This document documents/describes running a minimal test on [Illumina RNAseq](https://www.illumina.com/techniques/sequencing/rna-sequencing.html) data
- **Prerequisite software:**
- **OS:** ORAC (CentOS Linux) (ESR production network)

## Table of contents

- [Illumina RNAseq](#illumina-rnaseq)
  - [Table of contents](#table-of-contents)
  - [jejunum_rna](#jejunum_rna)
    - [Setup](#setup)
    - [Get data](#get-data)
    - [Merge fastqs and format fastq file names](#merge-fastqs-and-format-fastq-file-names)
    - [Run rnaseq pipeline](#run-rnaseq-pipeline)

## jejunum_rna

### Setup

### Get data

Get fastq data

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/
cp /NGS/clinicalgenomics/archive/2022/raw_data/jejunum_rna/fastq/J620*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/jejunum_rna/
cp /NGS/clinicalgenomics/archive/2022/raw_data/jejunum_rna/fastq/J631*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/jejunum_rna/
cp /NGS/clinicalgenomics/archive/2022/raw_data/jejunum_rna/fastq/J633*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/jejunum_rna/
cp /NGS/clinicalgenomics/archive/2022/raw_data/jejunum_rna/fastq/J639*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/jejunum_rna/
```

### Merge fastqs and format fastq file names

Merge fastq files from different lanes

See my script at [./scripts/illumina_RNAseq/jejunum_rna/01_merge_fastq.sh](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/scripts/illumina_RNAseq/jejunum_rna/01_merge_fastq.sh)

Run script

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/
sbatch ./scripts/illumina_RNAseq/jejunum_rna/01_merge_fastq.sh
```

### Run rnaseq pipeline

Run [rnaseq](https://github.com/nf-core/rnaseq)

See my samplesheet at [./config/illumina_RNAseq/jejunum_rna/rnaseq_samplesheet.csv](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/config/illumina_RNAseq/jejunum_rna/rnaseq_samplesheet.csv), my script at [./scripts/illumina_RNAseq/jejunum_rna/02_rnaseq_pipeline_run.sh](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/scripts/illumina_RNAseq/jejunum_rna/02_rnaseq_pipeline_run.sh) and my conda env at [./scripts/envs/conda.nextflow.22.04.0_jejunum_rna.yml](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/scripts/envs/conda.nextflow.22.04.0_jejunum_rna.yml)

Run script

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/
sbatch ./scripts/illumina_RNAseq/jejunum_rna/02_rnaseq_pipeline_run.sh
```
