process CUTADAPT {

    tag "$fastq.simpleName"

    input:
    path fastq

    output:
    path "trimmed.fastq"

    script:
    """
    ${params.cutadapt_bin} -a AGATCGGAAGAG -o trimmed.fastq ${fastq}
    """
}
