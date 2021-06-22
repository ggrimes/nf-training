/*
 * pipeline input parameters
 */
params.reads = "$projectDir/data/yeast/reads/ref1_{1,2}.fq.gz"
params.transcript = "$projectDir/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"
params.multiqc = "$projectDir/multiqc"

println "reads: $params.reads"
