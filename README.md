# README

Minimal tests for the amount of compute resources required for analysing human genomics datasets at ESR

## Dataset types tested

- [Illumina RNAseq](https://www.illumina.com/techniques/sequencing/rna-sequencing.html)
- [Illumina small RNAseq](https://www.illumina.com/techniques/sequencing/rna-sequencing/small-rna-seq.html)
- [Illumina whole exome sequencing (WES)](https://www.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/exome-sequencing.html)
- [Illumina whole genome sequencing (WGS)](https://www.illumina.com/techniques/sequencing/dna-sequencing/whole-genome-sequencing.html)
- [Nanopore whole genome sequencing (WGS)](https://nanoporetech.com/applications/whole-genome-sequencing)

## Tests

- [Illumina RNAseq](./docs/analysis_docs/illumina_RNAseq.md)
- [Illumina small RNAseq](./docs/analysis_docs/illumina_smallRNAseq.md)
- [Illumina whole exome sequencing (WES)](./docs/analysis_docs/illumina_WES.md)
- [Illumina whole genome sequencing (WGS)](./docs/analysis_docs/illumina_WGS.md)
- [Nanopore whole genome sequencing (WGS)](./docs/analysis_docs/nanopore_WGS.md)

## ESR human genomics datasets

- [Datasets](./docs/datasets/datasets.csv)

## Resources

- [Resource use](./results/resource_use.csv)

## To do

Things that would reduce the temporary space demands:

- [ ] Establish READONLY permissions on human genomics raw data so I don't make a copy of the data on scratch to analyse (I currently do this to reduce the chance of damaging raw data)
- [ ] Hopefully nextflow can implement [this feature](https://github.com/nextflow-io/nextflow/issues/452) to delete temporary files as soon as they are not needed during the pipeline run
