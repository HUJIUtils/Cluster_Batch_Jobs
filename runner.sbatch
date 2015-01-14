#!/bin/bash

script_name=$1
job_name_prefix=$2
log_dir=$3

# export the logs dir for our actual script
export log_dir

start_param_1=10
start_param_2=0

end_param_1=50
end_param_2=10

increment_param_1=5
increment_param_2=5

PARAM_1=0
PARAM_2=0
PARAM_1_TEMP=$start_param_1
PARAM_2_TEMP=$start_param_2

# loop over the first parameter
while [ $PARAM_1_TEMP -le $end_param_1 ]; do

  # reset second param
  let PARAM_2_TEMP=$start_param_2

  # scale first param if needed (here we scale down by 100), unmark if unneeded
  PARAM_1=$(echo "$PARAM_1_TEMP/100"|bc -l)

  # loop over the second parameter
  while [ $PARAM_2_TEMP -le $end_param_2 ]; do
    # scale first param if needed (here we scale down by 10), unmark if unneeded
    PARAM_2=$(echo "$PARAM_2_TEMP/10"|bc -l)

    # export the parameters so they will be available on the running script
    export PARAM_1 PARAM_2

    # run the batch script
    sbatch -o ${logs_dir}/out_p1_${PARAM_1}_p2_${PARAM_2}.stdout.txt \
    -e ${logs_dir}/err_p1_${PARAM_1}_p2_${PARAM_2}.stdout.txt \
    --job-name=${job_name_prefix}_p1_${PARAM_1}_p2_${PARAM_2} \
    ${script_name}

  done
  let PARAM_1_TEMP=PARAM_1_TEMP+$increment_param_1
done
