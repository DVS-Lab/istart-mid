#!/bin/bash

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
basedir="$(dirname "$scriptdir")"
nruns=2
task=mid # edit if necessary

for ppi in "dmn"; do #<img src="figures/VSConn_mask-leftVS_dACC_Contr-Conn Gain>Neut.svg" alt="" /><img src="figures/VSConn_mask-leftVS_dACC_Contr-Conn Gain>Neut.svg" alt="" /><img src="figures/VSConn_mask-leftVS_dACC_Contr-Conn Gain>Neut.svg" alt="" />; do  #in 0 NAcc; do # putting 0 first will indicate "activation"

	for sub in `cat ${scriptdir}/_newsubs.txt`; do #`cat ${scriptdir}/_newsubs.txt`; do #1300; do #
	#for sub in 1001; do	
		for run in 1 2; do

		model=4

			# some exceptions, hopefully temporary
			#if [ $sub -eq 1240 ] || [ $sub -eq 1245 ] || [ $sub -eq 1247 ] || [ $sub -eq 1248 ] || [ $sub -eq 1003 ]; then # bad data
				#echo "skipping both runs for sub-${sub} for task-${task}"
				#continue
			#fi
			#if [ $sub -eq 1002 ] && [ $run -eq 2 ]; then # bad data
				#echo "skipping run-2 for sub-${sub} for task-${task}"
				#continue
			#fi

	  	# Manages the number of jobs and cores
	  	SCRIPTNAME=${basedir}/code/L1stats.sh
	  	NCORES=4
	  	while [ $(ps -ef | grep -v grep | grep $SCRIPTNAME | wc -l) -ge $NCORES ]; do
	    		sleep 5s
	  	done

	  	bash $SCRIPTNAME $sub $run $ppi $model &
			sleep 2s
	  done
    done
done
