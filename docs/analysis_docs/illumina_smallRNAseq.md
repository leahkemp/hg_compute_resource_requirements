# Illumina smallRNAseq

Created: 2022/07/20 16:07:39
Last modified: 2022/07/20 16:37:09

- **Aim:** This document documents/describes running a minimal test on [Illumina small RNAseq](https://www.illumina.com/techniques/sequencing/rna-sequencing/small-rna-seq.html) data
- **Prerequisite software:**
- **OS:** ORAC (CentOS Linux) (ESR production network)

## Table of contents

- [Illumina smallRNAseq](#illumina-smallrnaseq)
  - [Table of contents](#table-of-contents)
  - [concussion_sncrna](#concussion_sncrna)
    - [Setup](#setup)
    - [Get data](#get-data)
    - [Merge fastqs and format fastq file names](#merge-fastqs-and-format-fastq-file-names)
    - [Run smrnaseq pipeline](#run-smrnaseq-pipeline)

## concussion_sncrna

### Setup

### Get data

Get fastq data

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/
cp /NGS/clinicalgenomics/archive/2022/raw_data/concussion_sncrna/fastq/AGRF_CAGRF22039970_HF5NKDMXY/CTRL_01_A*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/concussion_sncrna/
cp /NGS/clinicalgenomics/archive/2022/raw_data/concussion_sncrna/fastq/AGRF_CAGRF22039970_HF5NKDMXY/CTRL_02_A*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/concussion_sncrna/
cp /NGS/clinicalgenomics/archive/2022/raw_data/concussion_sncrna/fastq/AGRF_CAGRF22039970_HF5NKDMXY/RUGBY_01_A*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/concussion_sncrna/
cp /NGS/clinicalgenomics/archive/2022/raw_data/concussion_sncrna/fastq/AGRF_CAGRF22039970_HF5NKDMXY/RUGBY_01_B*.fastq.gz /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/fastq_raw/concussion_sncrna/
```

### Merge fastqs and format fastq file names

Merge fastq files from different lanes

See my script at [./scripts/illumina_smallRNAseq/concussion_sncrna/01_merge_fastq.sh](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/scripts/illumina_smallRNAseq/concussion_sncrna/01_merge_fastq.sh)

Run script

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/
sbatch ./scripts/illumina_smallRNAseq/concussion_sncrna/01_merge_fastq.sh
```

### Run smrnaseq pipeline

Run [smrnaseq](https://github.com/nf-core/smrnaseq)

See my samplesheet at [./config/illumina_smallRNAseq/concussion_sncrna/smrnaseq_samplesheet.csv](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/config/illumina_smallRNAseq/concussion_sncrna/smrnaseq_samplesheet.csv), my script at [./scripts/03_smrnaseq_pipeline_run/01_smrnaseq_pipeline_run.sh](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/scripts/03_smrnaseq_pipeline_run/01_smrnaseq_pipeline_run.sh) and my conda env at [./scripts/envs/conda.nextflow.22.04.0.yml](https://github.com/leahkemp/hg_compute_resource_requirements/blob/main/scripts/envs/conda.nextflow.22.04.0.yml)

Run script

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/hg_compute_resource_requirements/
sbatch ./scripts/illumina_smallRNAseq/concussion_sncrna/02_smrnaseq_pipeline_run.sh
```
