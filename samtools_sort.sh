# Do the work
while read -r files
do

samtools sort -@ 6 -O bam -o sorted/$files"_sorted.bam" $files"_aln.bam" 1>>log.out 2>>log.err

done < data_samtools_sort.txt
