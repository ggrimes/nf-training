pairs_ch = Channel.fromFilePairs('data/yeast/reads/*_{1,2}.fq.gz')
pairs_ch.view()
multi_ch = Channel.fromFilePairs('data/yeast/reads/*_{1,2,3}_{1,2}.fq.gz', size:6)
multi_ch.view()
