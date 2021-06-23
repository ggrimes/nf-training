//process_exercise_tuple.nf
nextflow.enable.dsl=2

process FASTQC {
input:
  tuple ___(sample_id), ___(reads)
output:
   tuple ___(sample_id), ___("fastqc_out")
 script:
 """
 mkdir fastqc_out
 fastqc $reads -o fastqc_out -t 1
 """
}
reads_ch = Channel.fromFilePairs('data/yeast/reads/ref*_{1,2}.fq.gz')

workflow{
 FASTQC(reads_ch)
 FASTQC.out.view()
}
