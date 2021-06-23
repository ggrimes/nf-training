//process_tuple_input.nf
nextflow.enable.dsl=2

process TUPLEINPUT{
  input:
    tuple val(sample_id), path(reads)
  script:
  """
  echo $sample_id
  echo $reads
  """
}

reads_ch = Channel.fromFilePairs('data/yeast/reads/ref1_{1,2}.fq.gz')

workflow {
  TUPLEINPUT(reads_ch)
}
