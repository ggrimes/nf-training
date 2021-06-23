//process_exercise_input.nf
nextflow.enable.dsl=2

process FASTQC {
   //add input channel

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
