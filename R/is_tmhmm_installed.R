#' Measure if TMHMM is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is TMHMM is installed locally,
#'   FALSE otherwise
#' @examples
#' library(testthat)
#'
#' install_tmhmm()
#' expect_true(is_tmhmm_installed())
#' @author Richel J.C. Bilderbeek
#' @export
is_tmhmm_installed <- function(
  folder_name = get_default_tmhmm_folder()
) {
  is_tmhmm_bin_installed(folder_name = folder_name) &&
    is_tmhmm_set_up(folder_name = folder_name)
}

#' Measure if TMHMM binary is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is TMHMM binary is installed locally,
#'   FALSE otherwise
#' @author Richel J.C. Bilderbeek
#' @export
is_tmhmm_bin_installed <- function(
  folder_name = get_default_tmhmm_folder()
) {
  bin_file_path <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  file.exists(bin_file_path)
}
