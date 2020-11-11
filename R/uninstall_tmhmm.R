#' Uninstall TMHMM
#'
#' Uninstall TMHMM. Will stop if TMHMM is not installed.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   uninstall_tmhmm()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_tmhmm <- function(
  folder_name = get_default_tmhmm_folder()
) {
  if (!is_tmhmm_installed(folder_name = folder_name)
  ) {
    stop("Cannot uninstall absent TMHMM at folder '", folder_name, "'")
  }
  bin_file_path <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  testthat::expect_true(file.exists(bin_file_path))
  file.remove(bin_file_path)
}
