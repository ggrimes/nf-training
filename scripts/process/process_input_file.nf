//process_input_file.nf
nextflow.enable.dsl=2

process NUMLINES {
    input:
    path read
    script:
    """
    printf '${read} '
    gunzip -c ${read} | wc -l
    """
}

reads_ch = Channel.fromPath( 'data/yeast/reads/ref*.fq.gz')

workflow {
  NUMLINES(reads_ch)
}
