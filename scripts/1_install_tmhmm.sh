#!/bin/bash
# Script to install TMHMM and its dependencies
# on the Peregrine computer cluster
#
# Usage:
#
# * To install master:
#
# sbatch 1_install_tmhmm.sh
#
# * To install a branch, e.g. develop:
#
# sbatch 1_install_tmhmm.sh develop
#
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=install_tmhmm
#SBATCH --output=install_tmhmm.log
module load GCCcore/4.9.3 
module load XZ/5.2.2-foss-2016a
module load R

branch=$1
if [ "$#" -ne 1 ]; then
  branch=master
fi

echo "Installing GitHub"
Rscript -e "devtools::install_github(\"richelbilderbeek/tmhmm\", ref = \"$branch\")" 

echo "Installing TMHMM"
Rscript -e 'tmhmm::install_tmhmm()'

echo "TMHMM binary installed:"
Rscript -e 'tmhmm::is_tmhmm_bin_installed()' 

echo "TMHMM set up:"
Rscript -e 'tmhmm::is_tmhmm_set_up()'

echo "TMHMM run:"
Rscript -e 'tmhmm::run_tmhmm(system.file("extdata", "tmhmm.fasta", package = "tmhmm"))'




