/*
Forking operators split a single channel into multiple channels.
*/

channel
     .of( 'chr1', 'chr2', 'chr3' )
     .into({ ch1; ch2 })
