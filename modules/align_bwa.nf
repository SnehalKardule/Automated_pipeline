process BWA_ALIGN {

    input:
    path fastq
    path reference

    output:
    path "aligned.sam"

    script:
    """
    ${params.bwa_bin} index ${reference}
    ${params.bwa_bin} mem ${reference} ${fastq} > aligned.sam
    """
}
