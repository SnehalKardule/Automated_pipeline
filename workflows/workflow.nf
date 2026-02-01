include { FASTQC as FASTQC_RAW }     from '../modules/fastqc.nf'
include { FASTQC as FASTQC_TRIMMED } from '../modules/fastqc.nf'
include { CUTADAPT }                 from '../modules/cutadapt.nf'
include { BWA_ALIGN }                from '../modules/align_bwa.nf'
include { SAM_TO_BAM }               from '../modules/sam_to_bam.nf'
include { SORT_BAM }                 from '../modules/sortbam.nf'
include { VARIANT_CALLING }          from '../modules/variantcalling.nf'

workflow qc_pipeline {

    reads_ch = channel.fromPath(params.fastq)
    ref_ch   = channel.fromPath(params.reference)

    FASTQC_RAW(reads_ch)

    trimmed_ch = CUTADAPT(reads_ch)

    FASTQC_TRIMMED(trimmed_ch)

    bam_ch = BWA_ALIGN(trimmed_ch, ref_ch)

    bam2_ch = SAM_TO_BAM(bam_ch)

    sorted_bam_ch = SORT_BAM(bam2_ch)

    VARIANT_CALLING(sorted_bam_ch, ref_ch)
}
