#PBS -N cut
#PBS -m bea
#PBS -M jamesthornton@email.arizona.edu
#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=4Gb
#PBS -l cput=6:0:0
#PBS -l walltime=3:0:0
#PBS -l jobtype=htc_only

FILE_NAME=`basename $FILE | cut -d '.' -f 1`

$BIN_DIR/cutadapt -a $F_PRIMER -A $R_PRIMER -o $CUT_OUT/$FILE_NAME.$F_PREFIX.cutrc_p.fastq -p $CUT_OUT/$FILE_NAME.$R_PREFIX.cutrc_p.fastq -m $MIN_LENGTH --too-short-output $CUT_OUT/$FILE_NAME.tooshort.fastq $FASTQ_DIR/$FILE_NAME.$F_PREFIX.fastq $PAIRED_DIR/$FILE_NAME.$R_PREFIX.fastq

