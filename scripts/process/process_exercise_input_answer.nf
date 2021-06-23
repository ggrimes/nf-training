//process_exercise_input_answer.nf
nextflow.enable.dsl=2

process FASTQC {
   input:
   path reads
   script:
   """
   mkdir fastqc_out
   fastqc -o fastqc_out ${reads}
   """
}
reads_ch = Channel.fromPath( 'data/yeast/reads/*_1.fq.gz' )

workflow {
  FASTQC(reads_ch)
}
