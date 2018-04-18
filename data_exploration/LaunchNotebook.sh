#!/bin/bash
#SBATCH --account=ewhite
#SBATCH --job-name=jupyter
#SBATCH --output=/home/b.weinstein/logs/jupyter.log
#SBATCH --ntasks=2
#SBATCH --mem=4gb
#SBATCH --time=04:00:00
#SBATCH --error=/home/b.weinstein/logs/jupyter.err

date;hostname;pwd

source activate voxelnet
export XDG_RUNTIME_DIR=${TMPDIR}

port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command: ssh -NL ${port}:$(hostname):${port} ${USER}@hpg.rc.ufl.edu"
echo -e "\nLocal URI: http://localhost:${port}"
jupyter-notebook --no-browser --port=${port} --ip='*'

date
