//process_input_file_02.nf
nextflow.enable.dsl=2

process NUMLINES {
    input:
    path 'sample.fq.gz'
    script:
    """
    printf 'sample.fq.gz'
    gunzip -c sample.fq.gz | wc -l
    """
}

reads_ch = Channel.fromPath( 'data/yeast/reads/ref*.fq.gz')

workflow {
  NUMLINES(reads_ch)
}
