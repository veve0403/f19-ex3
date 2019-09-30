#!/bin/bash
#SBATCH --mail-type=ALL   # all types of alert will be sent to the email address
#SBATCH --mail-user=yi.wei@uconn.edu
#SBATCH --nodes=1  # number of physical computers we want
#SBATCH --ntasks=1  # the number of command we try to run
#SBATCH --cpus-per-task=1  # the number of CPU each task will take
#SBATCH --mem=4gb    # 2 GB of memory we want to reserve, if yours script exceed this memory, it will be killed by the system. 
#SBATCH --time=50:00:00     # also a hard limit, your script can run as long as an hour.
#SBATCH -e error_%A_%a.log    # error messages will go to a file
#SBATCH -o output_%A_%a.log   # output messages will go to a file 
#SBATCH --job-name=design    
#SBATCH --partition=serial    # where we want to run on the clusters. 
##### END OF JOB DEFINITION  #####

# Singularity commands, always make sure the your file has permission use chmod 755 filename. 
module load singularity
singularity run \
--bind /scratch/psyc5171/$USER:/data \
/scratch/psyc5171/containers/neurodesign_latest.sif \
/data/optimize_part4.py