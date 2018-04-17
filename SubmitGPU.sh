#!/bin/bash
#SBATCH --job-name=Voxelnet    # Job name
#SBATCH --mail-type=FAIL,END               # Mail events (NONE, BEGIN, END, FAIL, AL$
#SBATCH --mail-user=ben.weinstein@weecology.org   # Where to send mail
#SBATCH --account=ewhite

#SBATCH --ntasks=1                 # Number of MPI ranks
#SBATCH --cpus-per-task=1            # Number of cores per MPI rank
#SBATCH --time=12:00:00       #Time limit hrs:min:sec
#SBATCH --output=/home/b.weinstein/logs/Voxelnet.out   # Standard output and error log
#SBATCH --error=/home/b.weinstein/logs/Voxelnet.err
#SBATCH --distribution=cyclic:cyclic
#SBATCH --mem-per-cpu=2000
#SBATCH --partition=hpg2-gpu
#SBATCH --gres=gpu:tesla:1

#activate conda environment
source activate voxelnet

python -c "import tensorflow;print(tensorflow.__version__)"

#python /home/b.weinstein/voxelnet/train.py --alpha 1 --beta 10 --vis

date
