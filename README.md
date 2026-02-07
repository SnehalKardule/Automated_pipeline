
# Automated Nextflow Pipeline 

## Overview: 

This repository contains a modular, end-to-end Nextflow pipeline for preprocessing and analysis of next-generation sequencing (NGS) data.
The pipeline performs quality control, read trimming, post-trimming QC, read alignment, and variant calling using widely adopted bioinformatics tools.
It is designed for reproducibility, scalability, and clarity, using Nextflow DSL2 with isolated modules for each analysis step.

## Pipeline Workflow
```text 
Raw FASTQ  
↓  
FastQC (Raw Reads)  
↓  
Read Trimming  
↓  
FastQC (Trimmed Reads)  
↓  
Read Alignment (BAM)  
↓  
Variant Calling (VCF)
```
## Pipeline Steps 

### 1️.  Raw Read Quality Control
- Performs quality assessment on raw FASTQ reads
- Generates reports for:
  - Base quality
  - GC content
  - Duplication levels
  - Adapter contamination
- Helps identify sequencing issues before downstream analysis  
- **Tool:** FastQC

### 2. Read Trimming
- Removes adapter sequences and low-quality bases
- Improves overall read quality and alignment accuracy
- Implemented for single-end sequencing data  
- **Tool:** Cutadapt / Trimmomatic

### 3️. Quality Control After Trimming
- Runs FastQC on trimmed reads
- Confirms removal of adapters
- Verifies improvement in quality metrics  
- **Tool:** FastQC


### 4️. Read Alignment
- Aligns trimmed reads to the reference genome (chr22)
- Generates alignment files in BAM format
- Sorts and indexes BAM files for efficient downstream processing  
- **Tools:** BWA-MEM, Samtools

### 5️. Variant Calling & Filtering
- Performs variant calling from sorted BAM files
- Detects SNPs and small insertions/deletions (indels)
- Applies quality-based filtering to retain high-confidence variants  
- **Tool:** BCFtools

## Pipeline structure 


```text
├── README.md
├── data
│   ├── hg38_chr22.fa
│   └── sample.fastq
├── environment.yml
├── main.nf
├── modules
│   ├── align_bwa.nf
│   ├── cutadapt.nf
│   ├── fastqc.nf
│   ├── sam_to_bam.nf
│   ├── sortbam.nf
│   └── variantcalling.nf
├── nextflow.config
└── workflows
    └── workflow.nf
 ```
## Purpose


High-throughput sequencing data often contains technical artifacts and sequencing errors.
This pipeline addresses these challenges by:

- Identifying low-quality reads and adapter contamination
- Cleaning reads to improve alignment accuracy
- Mapping reads to a reference genome
- Detecting high-confidence genetic variants

## Running the Pipeline


### 1️. Clone the Repository
```bash
git clone https://github.com/SnehalKardule/Automated_pipeline.git
cd nf-pipeline
```
### 2️.  Create and Activate the Conda Environment
```bash
conda env create -f environment.yml
conda activate bnf
```
### 3️. Run the Pipeline
```bash
nextflow run main.nf
```

### 4️. Resume a Previous Run
```bash
nextflow run main.nf -resume
```
