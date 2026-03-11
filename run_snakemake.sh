#!/bin/bash

mamba activate snakemake
snakemake --use-conda \
      --cores 1
 #    --rerun-triggers mtime,code,params,input
