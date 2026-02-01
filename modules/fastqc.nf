process FASTQC {

    tag "$fastq.simpleName"

    input:
    path fastq

    output:
    path "*_fastqc.html"
    path "*_fastqc.zip"

    script:
    """
    ${params.fastqc_bin} ${fastq}
    """
}
