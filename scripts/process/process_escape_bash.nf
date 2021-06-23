//process_escape_bash.nf
nextflow.enable.dsl=2

process INDEX {

  script:
  """
  salmon index -t $projectDir/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz -i index --kmer $params.kmer
  echo "kmer size is $params.kmer"
  echo "index is located in" \$PWD
  """
}

params.kmer = 31

workflow {
  INDEX()
}
