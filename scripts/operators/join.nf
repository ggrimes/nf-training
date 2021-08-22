/*
The join operator creates a channel that joins together the items emitted by two channels
for which exits a matching key.
The key is defined, by default, as the first element in each item emitted.
*/
reads1_ch = channel
  .of(['wt', 'wt_1.fq'], ['mut','mut_1.fq'])

reads2_ch= channel
  .of(['wt', 'wt_2.fq'], ['mut','mut_2.fq'])
  
