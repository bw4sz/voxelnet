#!/bin/bash
#SBATCH --job-name=voxelnet_predictions    # Job name
#SBATCH --mail-type=FAIL,END               # Mail events (NONE, BEGIN, END, FAIL, AL$
#SBATCH --mail-user=ben.weinstein@weecology.org   # Where to send mail
#SBATCH --account=ewhite

#SBATCH --ntasks=1                 # Number of MPI ranks
#SBATCH --cpus-per-task=2            # Number of cores per MPI rank
#SBATCH --time=24:00:00       #Time limit hrs:min:sec
#SBATCH --output=/home/b.weinstein/logs/voxelnet_predictions.out   # Standard output and error log
#SBATCH --error=/home/b.weinstein/logs/voxelnet_predictions.err
#SBATCH --mem-per-cpu=9000
#SBATCH --partition=hpg2-gpu
#SBATCH --gres=gpu:tesla:1

#activate conda environment
source activate voxelnet

ml cuda

#python -c "import tensorflow;print(tensorflow.__version__)"

python /home/b.weinstein/voxelnet/test.py --tag 18_Apr_2018_15_02_03

/home/b.weinstein/voxelnet/kitti_eval/evaluate_object_3d_offline /ufrc/ewhite/b.weinstein/voxelnet_split/validation/label_2/ ./predictions

date
