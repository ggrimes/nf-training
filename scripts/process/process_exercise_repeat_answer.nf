//process_exercise_repeat.nf
nextflow.enable.dsl=2

process COMBINE {
 input:
 path transcriptome
 each kmer
 script:
  """
  salmon index -t $transcriptome -i index -k $kmer
  """
}

transcriptome_ch = channel.fromPath('data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz',checkIfExists: true)
kmer_ch = channel.of(21,27,31)

 workflow {
  COMBINE(transcriptome_ch,kmer_ch)
}
