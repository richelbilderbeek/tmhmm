#' Set up TMHMM
#' @author Richel J.C. Bilderbeek
#' @export
set_up_tmhmm <- function(
  tmhmm_bin_filename = get_default_tmhmm_bin_path()
) {
  testit::assert(file.exists(tmhmm_bin_filename))
  lines <- readLines(tmhmm_bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") {
    lines[1] <- "#!/usr/bin/perl"
  }
  writeLines(text = lines, con = tmhmm_bin_filename)
}