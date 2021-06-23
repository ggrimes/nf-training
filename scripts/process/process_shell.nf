//process_shell.nf
nextflow.enable.dsl=2

params.kmer = 31

process INDEX {

  shell:
  '''
  salmon index -t !{projectDir}/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz -i index --kmer !{params.kmer}
  echo "kmer size is  !{params.kmer}"
  echo "index is located in" $PWD
  '''
}

workflow {
  INDEX()
}
