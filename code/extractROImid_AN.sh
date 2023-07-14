#!/usr/bin/env bash

# This code extracts ROI from L3 results.

#!/usr/bin/env bash

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
maindir="$(dirname "$scriptdir")"


# Specify all the L3 models:

# COPE Nums:

 # 1.  Large Gain (USE)
 # 2.  Small Gain
 # 3.  Large Loss
 # 4.  Small Loss
 # 5.  Hit
 # 6.  Miss
 # 7.  Neutral
 # 8.  Gain-Loss
 # 9.  Gain-Neutral
 # 10. Loss-Neutral
 # 11. Salience (USE)
 # 12. Hit-Miss (USE)
 # 13. Large Gain-Small Gain
 # 14. Large Loss-Small Loss

 # L3 Models:

# 4A: SU*RS + SU*RS^2
# 4B: SU*RS 

# base paths

# Inputscd 
L3_model_dir=L3_model-1_task-mid_n48_flame1_model-4F-VBeta 
TYPE=act #act #w #nppi-ecn ppi_seed-NAcc-bin
N=48
cov=4F #_noINT

# Outputs

model=1

# Set path info

L3_model=L3_model-1_task-mid_n${N}-cov-${cov}
TASK=mid
INPUT=/ZPOOL/data/projects/istart-mid/derivatives/fsl/${L3_model_dir}/L3_task-mid_${TYPE}
#INPUT=/data/projects/istart-ugdg/derivatives/fsl/COPE/L3_model-19_task-ugdg_type-act-n54-cov-COMPOSITE-flame1/L3_model-19_task-ugdg_n54-cov-COMPOSITE # hard code for filtered func as it changes for each type of analsis.
outputdir=${maindir}/derivatives/imaging_plots

mkdir -p $outputdir

# activation: ROI name and other path information
for ROI in 'model-4E-VBeta_cnum-12_zstat-16_MPFC'; do 
#'seed-NAcc-thr' 'seed-vmPFC-5mm-thr' 'seed-ACC-50-thr' 'seed-SPL-thr'  'seed-mPFC-thr' 'seed-dlPFC-thr' 'seed-pTPJ-bin' 'seed-insula-thr'  'seed-insula-thr' 'seed-PCC_abb_extracted' 'seed-PCC_int_extracted' 'IFG_extracted' 'Insula_extracted' 'lputamen-bin' mask_act-no-int_cope-15_ugrpmod_zstat-14' 'mask_act-no-int_cope-9_ugppmod_zstat-4' 'mask_ppi-no-int_cope-14_ugpchoicepmod_zstat5' 'mask_act-no-int_cope-7_dgpcuepmod_zstat-10' 'mask_ppi-no-int_cope-11_dgppmod_zstat-10'  'mask_ppi-no-int_cope-7_dgpendowpmod_zstat-5'; do  #'seed-NAcc-thr' 'seed-vmPFC-5mm-thr' 'seed-ACC-50-thr' 'seed-SPL-thr' 'seed-insula-thr'  'seed-mPFC-thr' 'seed-dlPFC-thr' 'seed-pTPJ-thr' #'seed-dlPFC-UGR-bin'; do #
	MASK=${maindir}/masks/${ROI}.nii.gz #masks_jbw3/
	for COPENUM in 1 2 3 4 5 6 7 8 9 10 11 12 13 14; do # act 
		cnum_padded=`zeropad ${COPENUM} 2`
		DATA=`ls -1 ${INPUT}_cnum-${cnum_padded}*.gfeat/cope1.feat/filtered_func_data.nii.gz` # use normally
                # DATA=/data/projects/istart-ugdg/derivatives/fsl/covariates/zstats_${TYPE}_${cov}/zstats_${TYPE}_cope_${COPENUM}.nii.gz # z scored for parametric analyses.
		fslmeants -i $DATA -o ${outputdir}/${ROI}_type-${TYPE}_cov-${cov}_model-${model}_cope-${cnum_padded}.txt -m ${MASK}
		
	done
done

