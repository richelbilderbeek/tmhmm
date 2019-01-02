#' Determine if TMHMM is set up
#' @inheritParams default_params_doc
#' @return TRUE if TMHMM is set up, FALSE otherwise
#' @author Richel J.C. Bilderbeek
#' @export
is_tmhmm_set_up <- function(
  folder_name = get_default_tmhmm_folder()
) {
  tmhmm_bin_filename <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")

  if (!file.exists(tmhmm_bin_filename)) return(FALSE)
  lines <- readLines(tmhmm_bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") return(FALSE)
  TRUE
}
