# Do the work
while read -r files
do

sambamba view -h -t 3 -f bam -F "[XS] == null and not unmapped and not duplicate" $files"_sorted.bam" -o filtered/$files".bam" 1>>log.out 2>>log.err

done < files_sambamba_filter.txt
