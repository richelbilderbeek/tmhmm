# Convert a FASTA file to a topo file.
# Predict the topologies of the proteins found in the FASTA file
#
# Usage:
#
#   Rscript fasta_to_topo.R [fasta_filename] [topo_filename]
#
# For example,
#
#   Rscript fasta_to_topo.R  5728.fasta 5728.topo
#
args <- commandArgs(trailingOnly = TRUE)
if (1 == 2) {
  args <- c("5728.fasta", "5728.topo")
}
testthat::expect_equal(length(args), 2)
fasta_filename <- args[1]
testthat::expect_true(file.exists(fasta_filename))

topo_filename <- args[2]

tmhmm::run_tmhmm_to_file(
  fasta_filename = fasta_filename,
  tmhmm_filename = topo_filename
)

testthat::expect_true(file.exists(topo_filename))
