#' Uninstall TMHMM
#' @inheritParams default_params_doc
#' @param folder_name name of the folder
#'   where the TMHMM files are installed.
#'   The name of the TMHMM binary file will be at
#'   \code{[folder_name]/tmhmm-2.0c/bin/tmhmm}
#' @author Richel J.C. Bilderbeek
#' @export
uninstall_tmhmm <- function(
  folder_name = rappdirs::user_data_dir(),
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint tmhmm function
  if (!is_tmhmm_installed(folder_name = folder_name, os = os)
  ) {
    stop("Cannot uninstall absent TMHMM at folder '", folder_name, "'")
  }
  bin_file_path <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  testit::assert(file.exists(bin_file_path))
  file.remove(bin_file_path)
}
