#!/bin/bash

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
maindir="$(dirname "$scriptdir")"

# setting inputs and common variables
sub=$1
type=$2
task=mid # edit if necessary
#sm=5 # edit if necessary
modelnum=3 # edit if necessary
MAINOUTPUT=${maindir}/derivatives/fsl/sub-${sub}

runfiles=(${maindir}/derivatives/fsl/EVfiles/sub-${sub}/mid/run-*_ConHit.txt)

# --- start EDIT HERE start: exceptions and conditionals for the task
if [ "${#runfiles[@]}" -eq 2 ]; then
	NCOPES=14

	# ppi has more contrasts than act (phys), so need a different L2 template
	if [ "${type}" == "act" ]; then
		ITEMPLATE=${maindir}/templates/L2_task-${task}_model-${modelnum}_type-act.fsf
		NCOPES=${NCOPES}
	else
		ITEMPLATE=${maindir}/templates/L2_task-${task}_model-${modelnum}_type-ppi.fsf
		let NCOPES=${NCOPES}+1 # add 1 since we tend to only have one extra contrast for PPI
	fi
	# commenting out paths with smoothing kernel (sm) flag since we're not using it for this study
        #INPUT1=${MAINOUTPUT}/L1_task-${task}_model-1_type-${type}_run-1_sm
        INPUT1=${MAINOUTPUT}/L1_task-${task}_model-${modelnum}_type-${type}_run-1.feat
	#INPUT2=${MAINOUTPUT}/L1_task-${task}_model-1_type-${type}_run-2_sm-${sm}.feat
	INPUT2=${MAINOUTPUT}/L1_task-${task}_model-${modelnum}_type-${type}_run-2.feat

	# --- end EDIT HERE end: exceptions and conditionals for the task; need to exclude bad/missing runs


	# check for existing output and re-do if missing/incomplete
	#OUTPUT=${MAINOUTPUT}/L2_task-${task}_model-${modelnum}_type-${type}_sm-${sm}
        OUTPUT=${MAINOUTPUT}/L2_task-${task}_model-${modelnum}_type-${type}
	if [ -e ${OUTPUT}.gfeat/cope${NCOPES}.feat/cluster_mask_zstat1.nii.gz ]; then # check last (act) or penultimate (ppi) cope
		echo "skipping existing output"
	else
		echo "re-doing: ${OUTPUT}" >> re-runL2.log
		rm -rf ${OUTPUT}.gfeat

		# set output template and run template-specific analyses
		OTEMPLATE=${MAINOUTPUT}/L2_task-${task}_model-${modelnum}_type-${type}.fsf
		sed -e 's@OUTPUT@'$OUTPUT'@g' \
		-e 's@INPUT1@'$INPUT1'@g' \
		-e 's@INPUT2@'$INPUT2'@g' \
		<$ITEMPLATE> $OTEMPLATE
		feat $OTEMPLATE

		# delete unused files
		for cope in `seq ${NCOPES}`; do
			rm -rf ${OUTPUT}.gfeat/cope${cope}.feat/stats/res4d.nii.gz
			rm -rf ${OUTPUT}.gfeat/cope${cope}.feat/stats/corrections.nii.gz
			rm -rf ${OUTPUT}.gfeat/cope${cope}.feat/stats/threshac1.nii.gz
			rm -rf ${OUTPUT}.gfeat/cope${cope}.feat/filtered_func_data.nii.gz
			rm -rf ${OUTPUT}.gfeat/cope${cope}.feat/var_filtered_func_data.nii.gz
		done

	fi
else 
	echo "Subject: ${sub} has ${#runfiles[@]} runs instead of 2"
fi
