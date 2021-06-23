//process_combine.nf
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

num_ch = Channel.of(1,2,3)
letters_ch = Channel.of('a','b','c')

workflow {
  COMBINE(num_ch,letters_ch)
}
