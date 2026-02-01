process VARIANT_CALLING {

    input:
    path bam
    path reference

    output:
    path "variants.vcf"

    script:
    """
    ${params.bcftools_bin} mpileup -f ${reference} ${bam} |
    ${params.bcftools_bin} call -mv -Ov -o variants.vcf
    """
}
