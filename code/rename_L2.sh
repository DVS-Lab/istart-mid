#!/bin/bash

for sub in 1001 1002 1003 1004 1006 1007 1009 1010 1011 \
	1012 1013 1015 1016 1019 1021 1240 1242 1243 1244 \
	1245 1247 1248 1249 1251 1253 1255 1276 1282 1285 \
	1286 1294 1300 1301 1302 1303 3101 3116 3122 3125 \
	3140 3143 3152 3164 3166 3167 3170 3173 3175 3176 \
	3186 3189 3190 3199 3200 3206 3210 3212 3218 3220 3223; do
	
#	if [ -e sub-${sub}/L2_task-mid_model-4_type-seed-NAcc.gfeat ]; then
#		echo "Updating L2stats output for sub-${sub}"		
#		mv sub-${sub}/L2_task-mid_model-4_type-type-ppi_seed-NAcc.gfeat/ sub-${sub}/L2_task-mid_model-4_type-ppi_seed-NAcc.gfeat/
#	else
#		echo "No L2stats output for sub-${sub}"
#	fi

	for run in 1 2; do
		if [ -e sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}_sm-.feat ]; then
			echo "Updating L1stats output for sub-${sub}_run-${run}"		
			cp -r sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-${run}_sm-.feat sub-${sub}/L1_task-mid_model-4_type-ppi_seed-NAcc_run-1.feat
		else
			echo "No L1stats output for sub-${sub}_run-${run}"
		fi
	done
done