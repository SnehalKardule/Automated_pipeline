process SORT_BAM {

    input:
    path bam

    output:
    path "sorted.bam"

    script:
    """
    ${params.samtools_bin} sort ${bam} -o sorted.bam
    """
}
