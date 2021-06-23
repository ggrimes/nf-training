//process_combine_02.nf
nextflow.enable.dsl=2

process COMBINE {
  input:
  val x
  val y
  script:
   """
   echo $x and $y
   """
}

ch_num = Channel.of(1,2)
ch_letters = Channel.of('a','b','c','d')

workflow {
  COMBINE(ch_num,ch_letters)
}
