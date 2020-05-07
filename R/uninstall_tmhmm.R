#' Uninstall TMHMM
#' @param folder_name name of the folder
#'   where the TMHMM files are installed.
#'   The name of the TMHMM binary file will be at
#'   \code{[folder_name]/tmhmm-2.0c/bin/tmhmm}
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
