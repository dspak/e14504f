#!/bin/bash
#SBATCH --ntasks=10 --nodes=1
#SBATCH --time=12:00:00
#SBATCH --job-name=mrbayes_e14504f
#SBATCH --mail-user=daniel.spakowicz@yale.edu
#SBATCH --mail-type=ALL

# Produced by DS_tree.Rmd
# Dan Spakowicz
# 2017-05-24 21:35:45
# Submission file for the MrBayes analysis of the E14504F tree using the sequencing in the google sheet 'E14504F'

cd /project/fas/gerstein/djs88/e14504f/bayes
module load Apps/MrBayes/3.2.2
mpirun mb all.nex
