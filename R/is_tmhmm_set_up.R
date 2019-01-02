#' Determine if TMHMM is set up
#' @inheritParams default_params_doc
#' @return TRUE if TMHMM is set up, FALSE otherwise
#' @author Richel J.C. Bilderbeek
#' @export
is_tmhmm_set_up <- function(
  folder_name = get_default_tmhmm_folder()
) {
  bin_filename <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")

  if (!file.exists(bin_filename)) return(FALSE)
  lines <- readLines(bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") return(FALSE)

  options_filename <- file.path(
    folder_name, "tmhmm-2.0c", "lib", "TMHMM2.0.options"
  )
  testit::assert(file.exists(options_filename))
  lines <- readLines(options_filename)
  if (any(lines == "PrintNumbers")) return(FALSE)
  if (any(lines == "PrintScore")) return(FALSE)
  if (any(lines == "PrintStat")) return(FALSE)
  if (any(lines == "PrintSeq")) return(FALSE)
  TRUE
}
