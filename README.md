# GVHD_Exome
Pipeline process used for analysis of FASTQ formatted reads from exome sequencing against the GRCh38 reference genome.

Pipeline includes:

**1. Trimming:**
Trim galore. https://github.com/FelixKrueger/TrimGalore

**2. Alignment:**
Bowtie2. Langmead B, Salzberg S. Fast gapped-read alignment with Bowtie 2. Nature Methods. 2012, 9:357-359.​

**3. GATK Tools:**
Van der Auwera GA & O'Connor BD. (2020). Genomics in the Cloud: Using Docker, GATK, and WDL in Terra (1st Edition). O'Reilly Media. ​

**4. VCF Tools:**
The Variant Call Format and VCFtools, Petr Danecek, Adam Auton, Goncalo Abecasis, Cornelis A. Albers, Eric Banks, Mark A. DePristo, Robert Handsaker, Gerton Lunter, Gabor Marth, Stephen T. Sherry, Gilean McVean, Richard Durbin and 1000 Genomes Project Analysis Group, Bioinformatics, 2011​

**5. PLINK2.0:**
Chang CC, Chow CC, Tellier LCAM, Vattikuti S, Purcell SM, Lee JJ (2015) Second-generation PLINK: rising to the challenge of larger and richer datasets. GigaScience, 4.​

**6. The FUMA suite:**
K. Watanabe, E. Taskesen, A. van Bochoven and D. Posthuma. Functional mapping and annotation of genetic associations with FUMA. Nat. Commun. 8:1826. (2017).​
