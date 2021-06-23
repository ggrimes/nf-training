//process_exercise_directives.nf
nextflow.enable.dsl=2

process PRINTCHR {
  tag "tagging with chr$chr"
  cpus 1
  echo true

  input:
  val chr
  script:
  """
  echo processing chromosome: $chr
  echo number of cpus $task.cpus
  """
}

chr_ch = channel.of(1..22,'X','Y')

workflow {
  PRINTCHR(chr_ch)
}
