#' tmhmm: estimate the topoplogy of membrane proteins
#'
#' Each amino acid that is part a membrane protein can be
#' located either in the cytosol, membrane or at the exterior.
#' 'tmhmm' estimate this topology
#'
#' @examples
#' library(testthat)
#'
#' if (is_tmhmm_installed()) {
#'   fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#'   locatome <- run_tmhmm(fasta_filename)
#'
#'   # Show as text
#'   cat(locatome, sep = "\n")
#'
#'   # Show as data frame
#'   print(locatome_to_df(locatome))
#'
#'   # Show as plot
#'   plot_locatome(locatome)
#' }
#' @docType package
#' @author Richèl J.C. Bilderbeek
#' @name tmhmm
NULL
