# HPC Delta AI Guide

This repository serves as a guide to effectively use the HPC Delta AI system. It covers the following topics:

## Table of Contents
1. [Module Management](#module-management)
2. [Conda Environment Management](#conda-environment-management)
3. [Data Management](#data-management)
4. [Job Submission and Monitoring](#job-submission-and-monitoring)

---

## Module Management
Learn how to load and manage modules on the HPC system:  
Full instruction is [here](https://lmod.readthedocs.io/en/latest/010_user.html)
```bash

# List the modules loaded
module list

# List available modules
module avail

# Load a specific module
module load <module_name>

# Unload a module
module unload <module_name>

# Searching for Modules” section.:
module spider <module_part_name>
```

---

## Conda Environment Management
Steps to manage Conda environments:
```bash
# Load Conda module
module load anaconda

# Sometimes load error can be fixed by
conda init
```

---

## Data Management
Guidelines for managing data on the HPC system:
- Use `scp` or `rsync` to transfer files between local and HPC.
- Store large datasets in designated storage locations.
- Regularly clean up unused files to save space.

---

## Job Submission and Monitoring
Submit and monitor jobs using the scheduler:  
Running Jobs guideline is [here](https://docs.ncsa.illinois.edu/systems/deltaai/en/latest/user-guide/running-jobs.html).

### Partitions (Queues)

You can use `sinfo -s` to see which partitions are currently available.

| Partition/Queue      | Node Type | Max Nodes per job | Max Duration | Max Running in Queue/user | Charge Factor |
|-----------------------|-----------|-------------------|--------------|---------------------------|---------------|
| ghx4*                | GPU       | TBD               | 48 hr        | TBD                       | 1.0           |
| ghx4-interactive     | GPU       | 4                 | 2 hr         | TBD                       | 2.0           |

| Property         | Value       |
|-------------------|-------------|
| Memory per core   | 1000 MB     |
| Wall-clock time   | 30 minutes  |

### Submit Jobs
#### Batch scripts (`sbatch`) or interactive jobs (`srun`, `salloc`).
- Account name: `bemy-dtai-gh`
    ```bash
    # Use the `accounts` command to list the accounts
    $ accounts

    # sbatch
    $ sbatch tensorflow_cpu.slurm
    Submitted batch job 2337924
    $ squeue -u $USER
            JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            2337924 ghx4         tfcpu  mylogin  R       0:46      1 gh006
    # Cancel a job
    $ scancel <job_id>

    # Single core with 20GB of memory, with one task.
    srun --account=account_name --partition=ghx4 \
    --nodes=1 --gpus-per-node=1 --tasks=1 \
    --tasks-per-node=1 --cpus-per-task=8 --mem=20g \
    --pty bash
    ```

#### Key Options for `srun`

Here are some commonly used options for `srun`:

| Option                  | Description                                                             |
|-------------------------|-------------------------------------------------------------------------|
| `--partition=<name>`    | Specifies the partition/queue to use (e.g., `ghx4`, `ghx4-interactive`). |
| `--nodes=<num>`         | Number of nodes to allocate, e.g `1`.                                            |
| `--ntasks=<num>`        | Total number of tasks (processes) to run. e.g `1`                               |
| `--cpus-per-task=<num>` | Number of CPU cores per task. e.g `8`                                          |
| `--mem=<size>`          | Memory allocation per node (e.g., `20g` for 20 GB).                     |
| `--gpus-per-node=<num>`      | Number of GPUs to allocate per node. e.g `1`                                   |
| `--time=<hh:mm:ss>`     | Maximum runtime for the job.  e.g `00:30:00`                                          |
| `--pty`                 | Starts an interactive session (e.g., `--pty bash`).                     |

#### Direct `ssh` access to a compute node in a running job is enabled once the job has started
    ```bash
    $ ssh gh001
    gh001.delta.internal.ncsa.edu (172.28.22.64)
    Site: mgmt  Role: compute
    ```

```bash
# Submit a job
sbatch <job_script.sh>

# Check job status
squeue -u <username>

# Cancel a job
scancel <job_id>
```

---

For detailed instructions, refer to the documentation or contact the system administrator.