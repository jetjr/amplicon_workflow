#!/bin/sh

source ./config.sh

cd "$FASTQ_DIR"
export FILES_LIST="$FASTQ_DIR/files-list"
pwd
ls *.fastq > $FILES_LIST

while read FILE; do
    export FILE="$FILE"
    NUM_FILES=`wc -l $FILES_LIST | cut -d ' ' -f 1`
    
    #JOB_ID1=`qsub -v SCRIPT_DIR,BIN_DIR,CUT_OUT,FILE,F_PRIMER,R_PRIMER,F_PREFIX,R_PREFIX,MIN_LENGTH,FASTQ_DIR,PAIRED_DIR -N cutadapt -e "$STDERR_DIR" -o "$STDOUT_DIR" $SCRIPT_DIR/cutadaptV4_paired.sh`

done < $FILES_LIST

`cp $FILES_LIST $CUT_OUT`

cd "$CUT_OUT"
export CUT_LIST="$CUT_OUT/cut-list"
`sed 's/.fastq/.cutrc_p.fastq/' files-list > $CUT_LIST`

while read CUT_FILE; do
    export CUT_FILE="$CUT_FILE"
    
    JOB_ID2=`qsub -v SCRIPT_DIR,CUT_FILE,CUT_OUT,F_PREFIX,R_PREFIX,MIN_OVER,MIN_LEN,MAX_LEN,J_PARA,BIN_DIR -N Pear -W depend=afterany:$JOB_ID1 -e "$STDERR_DIR" -o "$STDOUT_DIR" $SCRIPT_DIR/pear_mergeV4.pbs`

done < $CUT_LIST

