#!/bin/bash

# This run_* script is a wrapper for L3stats.sh, so it will loop over several
# copes and models. Note that Contrast N for PPI is always PHYS in these models.


# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
maindir="$(dirname "$scriptdir")"


# this loop defines the different types of analyses that will go into the group comparisons
for analysis in ppi_seed-NAcc; do # act nppi-dmn nppi-ecn ppi_seed | type-${type}_run-01
	for INTerm in wOutInt; do #  wInt wOutInt running with and without Interactions interaction were correlated with main effects?
		analysistype=type-${analysis}

		# these define the cope number (copenum) and cope name (copename)
		if [ "${analysistype}" == "type-act" ]; then
			for copeinfo in "1 LargeGain" "2 SmallGain" "3 LargeLoss" "4 SmallLoss" "5 Hit" "6 Miss" "7 Neut" "8 Gain-Loss" "9 Gain-Neut" "10 Loss-Neut" "11 Salience" "12 Hit-Miss" "13 LG-SG" "14 LL-SL"; do
				# split copeinfo variable
				set -- $copeinfo
				copenum=$1
				copename=$2

				NCORES=12
				SCRIPTNAME=${maindir}/code/L3stats.sh
				while [ $(ps -ef | grep -v grep | grep $SCRIPTNAME | wc -l) -ge $NCORES ]; do
					sleep 1s
				done
				bash $SCRIPTNAME $copenum $copename $analysis $INTerm &
                                sleep 5s
			done


		elif [ "${analysistype}" == "type-ppi_seed-NAcc" ]; then
			for copeinfo in "1 LargeGain" "2 SmallGain" "3 LargeLoss" "4 SmallLoss" "5 Hit" "6 Miss" "7 Neut" "8 Gain-Loss" "9 Gain-Neut" "10 Loss-Neut" "11 Salience" "12 Hit-Miss" "13 LG-SG" "14 LL-SL" "15 NaccTC"; do
				# split copeinfo variable
				set -- $copeinfo
				copenum=$1
				copename=$2


				NCORES=12
				SCRIPTNAME=${maindir}/code/L3stats.sh
				while [ $(ps -ef | grep -v grep | grep $SCRIPTNAME | wc -l) -ge $NCORES ]; do
					sleep 1s
				done
				bash $SCRIPTNAME $copenum $copename $analysistype $INTerm &

			done
		fi
	done
done
