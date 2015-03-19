# cluster_batch_jobs
A script enabling you to run multiple jobs on the HUJI slurm clusters.

Currently it is configured to run 2 parameters, you can modify them inside the
````runner.sbatch```` script.

to run the script:

    sh runner.sbatch <script_name> <job_name_prefix> <log_dir>


or the new version (preffered):

    sh new_runner.sbatch <script_name> <job_name_prefix>
        <log_dir> <#cores> <memory> <time> <path_to_file> <param1> <param2>
