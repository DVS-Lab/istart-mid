#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
maindir="$(dirname "$scriptdir")"

#for sub in `cat ${scriptdir}/_newsubs.txt`; do 
for sub in 3218; do
	for run in 1; do
		rm /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/standard.nii.gz
		rm /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/example_func2standard.mat
		rm /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/standard2example_func.mat	
		
		ln -s /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/mean_func.nii.gz /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/standard.nii.gz
	   ln -s /usr/local/fsl/etc/flirtsch/ident.mat /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/example_func2standard.mat
		ln -s /usr/local/fsl/etc/flirtsch/ident.mat /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/standard2example_func.mat
		#cp /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/mean_func.nii.gz /ZPOOL/data/projects/istart-mid/derivatives/fsl/sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}.feat/reg/standard.nii.gz
		#echo "fixed reg standard for" $sub $run
	done
done