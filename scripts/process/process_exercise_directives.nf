//process_exercise_directives.nf
nextflow.enable.dsl=2

 process FASTQC {
 //add tag directive
 //add cpu directive
 input:
    tuple val(sample_id), path(reads)
 output:
     tuple val(sample_id), path("fastqc_out")
  script:
   """
   mkdir fastqc_out
   fastqc $reads -o fastqc_out -t 1
   """
 }

read_pairs_ch = Channel.fromFilePairs('data/yeast/reads/ref*_{1,2}.fq.gz')
workflow {
 FASTQC(read_pairs_ch)
 FASTQC.out.view()
}
