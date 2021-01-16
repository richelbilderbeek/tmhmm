#' tmhmm: estimate the topoplogy of membrane proteins
#'
#' Each amino acid that is part a membrane protein can be
#' located either in the cytosol, membrane or at the exterior.
#' 'tmhmm' estimate this topology
#'
#' @examples
#'
#' if (is_tmhmm_installed()) {
#'   fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#'   topology_text <- run_tmhmm(fasta_filename)
#'
#'   # Show as text
#'   print(topology_text, sep = "\n")
#'
#'   # Show as data frame
#'   print(fasta_text_to_tibble(topology_text))
#'
#'   # Show as plot
#'   plot_topology_text(topology_text)
#' }
#' @docType package
#' @author Richèl J.C. Bilderbeek
#' @name tmhmm
NULL
