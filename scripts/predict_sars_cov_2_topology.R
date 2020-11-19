library(tmhmm)

# Use an example proteome
fasta_filename <- system.file(
  "extdata",
  "UP000464024.fasta",
  package = "tmhmm"
)

# Predict the topology
topology <- predict_topology(fasta_filename)

# Simplify the protein names
topology$name <- stringr::str_match(
  string = topology$name,
  pattern = "..\\|.*\\|(.*)_SARS2"
)[,2]

# Plot the topology
plot_topology(topology)
