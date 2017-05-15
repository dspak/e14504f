#!/bin/bash
#SBATCH --ntasks=10 --nodes=1
#SBATCH --time=12:00:00
#SBATCH --job-name=mrbayes_e14504f
#SBATCH --mail-user=daniel.spakowicz@yale.edu
#SBATCH --mail-type=ALL

# Produced by DS_tree.Rmd
# Dan Spakowicz
# 14 May 2017
# Submission file for the MrBayes analysis of the E14504F tree, using [@gonzalez_phylogenetic_2016] alignment as a reference

cd /project/fas/gerstein/djs88/e14504f
module load Apps/MrBayes/3.2.2
mb combined_bayes.nex
