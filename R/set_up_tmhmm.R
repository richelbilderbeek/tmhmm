#' Set up TMHMM
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
set_up_tmhmm <- function(
  folder_name = get_default_tmhmm_folder()
) {
  tmhmm_bin_filename <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  testit::assert(file.exists(tmhmm_bin_filename))
  lines <- readLines(tmhmm_bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") {
    lines[1] <- "#!/usr/bin/perl"
  }
  writeLines(text = lines, con = tmhmm_bin_filename)
}