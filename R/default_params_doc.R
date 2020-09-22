#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param download_url the URL to download TMHMM from
#' @param fasta_filename path to a FASTA file
#' @param folder_name superfolder of TMHMM.
#'   The superfolder's name is \code{/home/[user_name]/.local/share}
#'   by default, as can be obtained by
#'   \link{get_default_tmhmm_folder}
#' @param locatome text similar to a FASTA file, with protein names
#'   and the locations of its amino acids
#' @param protein_sequence a protein sequence
#' @param protein_sequences one or more protein sequences
#' @param tmhmm_bin_filename path to the TMHMM binary file.
#'   Its default path can be ontained by using
#'   \link{get_default_tmhmm_bin_path}
#' @param tmhmm_filename filename to write the TMHMM results to
#' @param tmhmm_result the results of a call to TMHMM,
#' for example, \code{c(">protein name", "ooooMMMMiiiii")}
#' @param topology a tibble with two columns,
#'   named \code{name} for a protein's name and \code{topology},
#'   for its predicted topology (e.g. \code{ooooMMMMiiiii}).
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  download_url,
  fasta_filename,
  folder_name,
  locatome,
  protein_sequence,
  protein_sequences,
  tmhmm_bin_filename,
  tmhmm_filename,
  tmhmm_result,
  topology,
  verbose
) {
  # Nothing
}
