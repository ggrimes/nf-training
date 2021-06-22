nextflow.enable.dsl=2

/*
 * pipeline input parameters
 */
params.reads = "$projectDir/data/yeast/reads/*_{1,2}.fq.gz"
params.transcriptome = "$projectDir/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"
params.multiqc = "$projectDir/multiqc"
params.outdir = "results"

log.info """\
         R N A S E Q - N F   P I P E L I N E
         ===================================
         transcriptome: ${params.transcriptome}
         reads        : ${params.reads}
         outdir       : ${params.outdir}
         """
         .stripIndent()

/*
 * define the `index` process that create a binary index
 * given the transcriptome file
 */
process index {

    input:
    path transcriptome

    output:
    path 'index'

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i index
    """
}

transcriptome_ch=channel.fromPath(params.transcriptome)

workflow {
  index(transcriptome_ch)
}
