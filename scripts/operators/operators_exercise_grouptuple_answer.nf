ch = channel.fromPath('data/yeast/reads/*.fq.gz')
    .map { file -> [ file.name.split('_')[0], file ] }
    .groupTuple()
    .view()
