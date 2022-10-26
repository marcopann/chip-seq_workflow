# Do the work
while read -r files
do

bowtie2 -p 6 -q -x grch38_chipseq/grch38_1-22_X/grch38 -U chip_g4_june2022/clean_reads/$files"_trim.fastq.gz"|samtools view -@ 6 -h -bS -o chip_g4_june2022/alignment_results/$files"_aln.bam" 1>>chip_g4_june2022/alignment_results/log_out/$files"_logout.txt" 2>>chip_g4_june2022/alignment_results/log_err/$files"_logerr.txt"

echo $files"_DONE"

done < data_bowtie2.txt
