#!/bin/bash

# Configure the resources required
#SBATCH -p a100                                         # partition (this is the queue your job will be added to)
#SBATCH -N 1
#SBATCH -n 1              	                            # number of tasks (sequential job starts 1 task) (check this if your job unexpectedly uses 2 nodes)
#SBATCH -c 8                   	                        # number of cores (sequential job calls a multi-thread program that uses 8 cores)
#SBATCH --time=2-00:00:00                               # time allocation, which has the format (D-HH:MM), here set to 1 hour
#SBATCH --gres=gpu:4                                    # generic resource required (here requires 4 GPUs)
#SBATCH --mem=32GB                                      # specify memory required per node (here set to 16 GB)

# Configure notifications 
#SBATCH --mail-type=END                                 # Send a notification email when the job is done (=END)
#SBATCH --mail-type=FAIL                                # Send a notification email when the job fails (=FAIL)
#SBATCH --mail-user=christopher.fusco@adelaide.edu.au   # Email to which notifications will be sent

# Execute your script (due to sequential nature, please select proper compiler as your script corresponds to)

export DETECTRON2_DATASETS=/hpcfs/groups/phoenix-hpc-acvt/data/detectron2
module purge
module use /apps/icl/modules/all
module load Anaconda3/2023.03
module load CUDA/11.6.2
source activate mask2former
~/.conda/envs/mask2former/bin/python3 train_net.py --num-gpus 4 --config-file configs/coco/panoptic-segmentation/maskformer.yaml
