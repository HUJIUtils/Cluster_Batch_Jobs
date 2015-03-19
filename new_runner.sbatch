#!/bin/bash

#${PARAM_FROM},${PARAM_D},${PARAM_TIMES},${SAVE_MAT},${G_TYPE},${E_TYPE},

script_name=$1
job_name_prefix=$2
cur_dir="`pwd`";
work_dir="$cur_dir/src";
log_dir="$cur_dir/$3";
num_cores=$4;
MEM=$5;
TIME=$6;
PATH_TO_FILE=$7;
# export the logs dir for our actual script
export log_dir cur_dir work_dir num_cores MEM TIME PATH_TO_FILE

function run {
  PARAM_1=$1;
  PARAM_2=$2;

  # export the parameters so they will be available on the running script
  # the names exported should be the names used inside the *.script parameters
  export PARAM_1 PARAM_2

  # echo just to be sure
  echo $PARAM_1 $PARAM_2

  log_name="${job_name_prefix}_${PARAM_1}_${PARAM_2}";
	# run the batch script
	sbatch -D`pwd` -c${num_cores} -o ${log_dir}/out_${log_name}.stdout.txt -e ${log_dir}/err_${log_name}.stderr.txt  --job-name=${job_name_prefix}_${log_name} ${script_name}
}

# assuming you have two additional parameters
run $8 $9;
