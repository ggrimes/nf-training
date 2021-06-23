//process_combine_03.nf
nextflow.enable.dsl=2

process COMBINE {
  echo true
  input:
  val x
  val y
  script:
   """
   echo $x and $y
   """
}
ch_num = Channel.value(1)
ch_letters = Channel.of('a','b','c')

workflow {
  COMBINE(ch_num,ch_letters)
}
