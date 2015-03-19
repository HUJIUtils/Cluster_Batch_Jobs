#!/bin/bash

#${PARAM_FROM},${PARAM_D},${PARAM_TIMES},${SAVE_MAT},${G_TYPE},${E_TYPE},

script_name=$1
job_name_prefix=$2
cur_dir="`pwd`";
work_dir="$cur_dir/src";
log_dir="$cur_dir/$3";
num_cores=$4;
# export the logs dir for our actual script
export log_dir cur_dir work_dir num_cores

function run {
  MY_PARAM1=$1;
  MY_PARAM1=$2;
  My_PARAM3=$3;
  # export the parameters so they will be available on the running script
  # the names exported should be the names used inside the *.script parameters
  export MY_PARAM1 MY_PARAM2

  # echo just to be sure
  echo $MY_PARAM1 $MY_PARAM2

  log_name="${MY_PARAM1}_${MY_PARAM2}";
	# run the batch script
	sbatch -D`pwd` -c${num_cores} -o ${log_dir}/out_${log_name}.stdout.txt -e ${log_dir}/err_${log_name}.stderr.txt  --job-name=${job_name_prefix}_${log_name} ${script_name}
}

# assuming you have two additional parameters
run $5 $6 $7;
