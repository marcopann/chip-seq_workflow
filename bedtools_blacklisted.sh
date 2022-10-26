# Do the work
while read -r files
do

bedtools intersect -v -abam $files".bam" -b blacklist/hg38-blacklist.v2.bed > filtered_blacklist/$files".bam"

done < files_bedtools.txt
