nextflow.enable.dsl=2

include { index } from './modules/rnaseq-tasks.nf'

workflow {
    transcriptome_ch = channel.fromPath('data/yeast/transcriptome/*.fa.gz')
    //
    INDEX(transcriptome_ch)
}
