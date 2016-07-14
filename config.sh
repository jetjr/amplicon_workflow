#!/bin/bash

export CWD=$PWD
export FASTQ_DIR="$CWD/reads"
export PAIRED_DIR="$FASTQ_DIR/paired"
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"
export OUT_DIR="$CWD/results"
export SCRIPT_DIR="$CWD/scripts"
export VSEARCH_DIR="/rsgrps/bhurwitz/hurwitzlab/bin/vsearch"
export USEARCH_DIR="/rsgrps/bhurwitz/hurwitzlab/bin/usearch8.1.1861_i86linux32"
export OTU_DIR="/rsgrps/bhurwitz/hurwitzlab/bin/drive5_py"

# CutAdapt Parameters
export BIN_DIR="/rsgrps/bhurwitz/hurwitzlab/bin"
export CUT_OUT="$CWD/cutadapt"
export F_PRIMER="ATTAGAWACCCVNGTAGTCC"
export R_PRIMER="TTACCGCGGCKGCTGGCAC"
export MIN_LENGTH="100"

# Pear Parameters (for merging)

export MIN_OVER="200"
export MIN_LEN="220"
export MAX_LEN="270"
export J_PARA="12"

export F_PREFIX="R1"
export R_PREFIX="R2"

