# ChIP-seq Workflow (***in progress***)

ChIP-seq analysis workflow - From .fastq files, downstream to any sort of data processing and figures generation. Referred to a dataset with single-end reads only. 

***All the scripts are generated by me and provided singularly and separately, in the same repository.***

## Data pre-processing

### Quality control

.fastq files are quality-checked using **FastQC** (*https://www.bioinformatics.babraham.ac.uk/projects/fastqc/*).

### Trimming (optional)

When needed, trimming is performed with **Cutadapt** (*https://cutadapt.readthedocs.io/en/stable/*).

If trimming reads, perform a new quality assessment of trimmed reads before moving downstream the workflow.

### Alignment to reference genome

Clean reads are aligned to reference genome using **Bowtie2** (*https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml*).

Output alignment files will be directly in .bam format.

### Sorting

Aligned reads are sorted by genomic coordinates using **samtools sort** (*https://www.htslib.org/doc/samtools-sort.html*).

### Filtering

All unmapped reads, duplicates and multimappers are filtered out using **sambamba** (*https://lomereiter.github.io/sambamba/*).

Also, blacklisted regions are filtered out using **bedtools intersect** (*https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html*).

### Merging and indexing (optional)

Final filtered reads from each replicate are merged using **samtools merge** (*https://www.htslib.org/doc/samtools-merge.html*), and indexed using **samtools index** (*https://www.htslib.org/doc/samtools-index.html*).

***Merging replicates is your own decision, depending on your experiment design and if dealing with technical or biological replicates. However, it is always recommended to perform some sort of exploratory analysis (such as PCA), before deciding to merge your replicates.***

For any inquiry, please contact me at: marco.pannone@ntnu.no
