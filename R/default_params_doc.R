#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param fasta_filename path to a FASTA file
#' @param tmhmm_bin_filename path to the TMHMM binary file.
#'   Its default path can be ontained by using
#'   \link{get_default_tmhmm_bin_path}
#' @param verbose set to TRUE for more output
#' @author Richel J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  fasta_filename,
  tmhmm_bin_filename,
  verbose
) {
  # Nothing
}
