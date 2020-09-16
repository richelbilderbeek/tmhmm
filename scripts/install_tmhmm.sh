#!/bin/bash
#
# Installs TMHMM using the R code in the 'tmhmm' package
#
# Because the R code in the package uses 'tmhmm::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_tmhmm.sh
#
#
cat R/install_tmhmm.R > tempscript.R
cat R/get_default_tmhmm_folder.R >> tempscript.R
cat R/get_tmhmm_url.R >> tempscript.R
cat R/is_tmhmm_installed.R >> tempscript.R
cat R/is_tmhmm_set_up.R >> tempscript.R
cat R/set_up_tmhmm.R >> tempscript.R

echo "install_tmhmm()" >> tempscript.R
sed -i'.orginal' "s/tmhmm:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
