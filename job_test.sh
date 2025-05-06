conda deactivate
conda deactivate  # just making sure
module reset      # load the default DeltaAI modules

conda activate base
# commands to load modules and activate environs such that your environment is active before
# you use slurm ( do not include conda activate commands in the slurm script )

sbatch myjob.slurm  # or srun or salloc