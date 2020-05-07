#' Get the default path to the TMHMM binary
#' @return the default path to the TMHMM binary
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_tmhmm_bin_path <- function() {
  file.path(rappdirs::user_data_dir(), "tmhmm-2.0c", "bin", "tmhmm")
}
