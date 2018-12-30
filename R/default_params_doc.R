#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param download_url the URL to download TMHMM from
#' @param fasta_filename path to a FASTA file
#' @param folder_name superfolder of TMHMM.
#'   The superfolder's name is \code{/home/[user_name]/.local/share}
#'   by default, as can be obtained by
#'   \link{get_default_tmhmm_folder}
#' @param tmhmm_bin_filename path to the TMHMM binary file.
#'   Its default path can be ontained by using
#'   \link{get_default_tmhmm_bin_path}
#' @param verbose set to TRUE for more output
#' @author Richel J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  download_url,
  fasta_filename,
  folder_name,
  tmhmm_bin_filename,
  verbose
) {
  # Nothing
}
