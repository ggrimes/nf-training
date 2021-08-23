

/*
 * Run fastq preprocessing fastp
 */
process FASTP {
    tag "FASTP on $sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    path("*.fq.gz")

    script:
    """
    fastp -i ${reads[0]} -I ${reads[1]} -o ${sample_id}.pre_R1.fq.gz -O ${sample_id}.pre_R2.fq.gz
    """
}

Channel
    .fromFilePairs( params.reads, checkIfExists:true )
    .set { read_pairs_ch }

workflow {
  FASTP(read_pairs_ch)
}
