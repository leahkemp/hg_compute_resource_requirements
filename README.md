# README

Minimal tests for the amount of compute resources required for analysing human genomics datasets at ESR

## Dataset types tested

- [Illumina RNAseq](https://www.illumina.com/techniques/sequencing/rna-sequencing.html)
- [Illumina small RNAseq](https://www.illumina.com/techniques/sequencing/rna-sequencing/small-rna-seq.html)
- [Illumina whole exome sequencing (WES)](https://www.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/exome-sequencing.html)
- [Illumina whole genome sequencing (WGS)](https://www.illumina.com/techniques/sequencing/dna-sequencing/whole-genome-sequencing.html)
- [Nanopore whole genome sequencing (WGS)](https://nanoporetech.com/applications/whole-genome-sequencing)

## ESR human genomics datasets

- [Datasets](./docs/datasets/datasets.md)

## Resources

- Temporary space requirements eg. for pipeline runs

## To do

Things that would reduce the temporary space demands:

- [ ] establishing readonly permissions on human genomics raw data so I don't make a copy of the data on scratch to analyse (I currently do this to reduce the chance of damaging raw data)
