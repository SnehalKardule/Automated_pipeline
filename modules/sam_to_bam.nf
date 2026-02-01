process SAM_TO_BAM {

    input:
    path sam

    output:
    path "aligned.bam"

    script:
    """
    ${params.samtools_bin} view -Sb ${sam} > aligned.bam
    """
}
