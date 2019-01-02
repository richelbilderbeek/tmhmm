#' Checks the installation of TMHMM.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richel J.C. Bilderbeek
#' @export
check_tmhmm_installation <- function(
  folder_name = get_default_tmhmm_folder()
) {
  if (!is_tmhmm_bin_installed(folder_name = folder_name)) {
    bin_file_path <- file.path(
      folder_name, "tmhmm-2.0c", "bin", "decodeanhmm.Linux_x86_64"
    )
    stop(
      "TMHMM binary not found at location '\n",
      bin_file_path, "'\n",
      "\n",
      "Tip 1: from R, run 'tmhmm::install_tmhmm_bin()'\n",
      "  with a (non-expired) download URL\n",
      "Tip 2: request a download URL at the TMHMM request page at\n",
      "\n",
      "http://www.cbs.dtu.dk/services/TMHMM\n"
    )
  }
  if (!is_tmhmm_set_up(folder_name = folder_name)) {
    stop(
      "TMHMM not set up completely\n",
      "\n",
      "Tip: from R, run 'nethmhc2pan::set_up_tmhmm()'\n"
    )
  }
}