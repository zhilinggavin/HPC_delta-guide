# Single core with 20GB of memory, with one task.
account_name='bemy-dtai-gh'
srun --account=bemy-dtai-gh --partition=ghx4-interactive \
--nodes=1 --gpus-per-node=1 --tasks=1 \
--tasks-per-node=1 --cpus-per-task=8 --mem=20g \
--time=00:30:00 --pty bash

# For jupert notebook, use the following command:
# srun --account=bemy-dtai-gh --partition=ghx4-interactive --nodes=1 --gpus-per-node=1 --time=00:30:00 --mem=32g jupyter-notebook --no-browser --port=50942 --ip=0.0.0.0