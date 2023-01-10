#!/bin/bash
#SBATCH --time=06:00:00
#SBATCH --job-name=processVCFs
#SBATCH --partition=Orion
#SBATCH --ntasks-per-node=16
#SBATCH --mem=36GB

#update this if running the pipeline from a different directory
TMP_PATH=/nobackup/mougeots_research/micaela_beckman/gvhd_exome

GATK=/nobackup/mougeots_research/micaela_beckman/gvhd_exome/gatk/gatk-4.2.6.1/gatk
IN_DIR=$TMP_PATH/01_output_data
OUT_DIR=$TMP_PATH/merged_output_data
REF_DIR=nobackup/mougeots_research/adam_alexander/pipeline/00_Data/reference/GRCh38.fna

echo "======================================================"
echo "Start Time  : $(date)"
echo "Submit Dir  : $SLURM_SUBMIT_DIR"
echo "Job ID/Name : $SLURM_JOBID / $SLURM_JOB_NAME"
echo "Num Tasks   : $SLURM_NTASKS total [$SLURM_NNODES nodes @ $SLURM_CPUS_ON_NODE CPUs/node]"
echo "======================================================"
echo ""

#module load samtools
module load anaconda3
source activate bcftools

#bcftools view $IN_DIR/A004.vcf -Oz -o $IN_DIR/A004.bcf.gz
# make a text file which shows the path to each available vcf
rm "$OUT_DIR/vcf_list.txt"
ls $IN_DIR/*.vcf.gz >> "$OUT_DIR/vcf_list.txt"


# bcftools merge is used to combine all vcfs
bcftools merge \
--threads 16 \
--output "$OUT_DIR/keep_headers.vcf" \
--file-list "$OUT_DIR/vcf_list.txt"

conda deactivate bcftools
module unload anaconda3

# more formatting for plink, remove header lines with '##'
#sed -i '/^##/ d' "$OUT_DIR/gvhd_merged.vcf"

sed -i 's/AOS_/AOS-/g' "$OUT_DIR/gvhd_merged.vcf"
