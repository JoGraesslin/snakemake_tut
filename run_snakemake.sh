#!/bin/bash
mamba activate snakemake
snakemake --use-conda \
    --rerun-triggers mtime \
    --cores 1
 #mtime,code,params,input
