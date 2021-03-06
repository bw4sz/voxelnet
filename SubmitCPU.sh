#!/bin/bash
#SBATCH --job-name=voxelnet_cpu  # Job name
#SBATCH --mail-type=FAIL,END               # Mail events (NONE, BEGIN, END, FAIL, AL$
#SBATCH --mail-user=ben.weinstein@weecology.org   # Where to send mail
#SBATCH --account=ewhite

#SBATCH --ntasks=1                 # Number of MPI ranks
#SBATCH --cpus-per-task=2            # Number of cores per MPI rank
#SBATCH --mem=7000
#SBATCH --time=12:00:00       #Time limit hrs:min:sec
#SBATCH --output=/home/b.weinstein/logs/voxelnet_cpu.out   # Standard output and error log
#SBATCH --error=/home/b.weinstein/logs/voxelnet_cpu.err

source activate voxelnet_cpu

python /home/b.weinstein/voxelnet/train.py --alpha 1 --beta 10 --tag cpu --vis
