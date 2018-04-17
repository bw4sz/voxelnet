#!/bin/bash
#SBATCH --job-name=start_tensorboard   # Job name
#SBATCH --mail-type=FAIL,END               # Mail events (NONE, BEGIN, END, FAIL, AL$
#SBATCH --mail-user=ben.weinstein@weecology.org   # Where to send mail
#SBATCH --account=ewhite

#SBATCH --ntasks=1                 # Number of MPI ranks
#SBATCH --cpus-per-task=1            # Number of cores per MPI rank
#SBATCH --mem=1000
#SBATCH --time=12:00:00       #Time limit hrs:min:sec
#SBATCH --output=/home/b.weinstein/logs/tensorboard.out   # Standard output and error log
#SBATCH --error=/home/b.weinstein/logs/tensorboard.err

source activate tensorflow

tensorboard --logdir /home/b.weinstein/voxelnet/log
