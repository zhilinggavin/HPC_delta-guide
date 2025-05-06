# Single core with 20GB of memory, with one task.
srun --account=bemy-dtai-gh --partition=ghx4 \
--nodes=1 --gpus-per-node=1 --tasks=1 \
--tasks-per-node=1 --cpus-per-task=8 --mem=20g \
--time=00:30:00 --pty bash