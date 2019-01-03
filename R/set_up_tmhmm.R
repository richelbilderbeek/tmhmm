#' Set up TMHMM
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
set_up_tmhmm <- function(
  folder_name = get_default_tmhmm_folder()
) {
  bin_filename <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  if (!file.exists(bin_filename)) {
    stop(
      "TMHMM binary file absent at path '", bin_filename, "'.\n",
      "\n",
      "Tip: from R, run 'tmhmm::install_tmhmm()'\n",
      "  with a (non-expired) download URL\n"
    )
  }
  testit::assert(file.exists(bin_filename))
  lines <- readLines(bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") {
    # Peregrine by default
    lines[1] <- "#!/software/software/Perl/5.26.1-GCCcore-6.4.0/bin/perl"
    if (Sys.getenv("HOSTNAME") != "peregrine.hpc.rug.nl") {
      lines[1] <- "#!/usr/bin/perl"
    }
  }
  writeLines(text = lines, con = bin_filename)

  options_filename <- file.path(
    folder_name, "tmhmm-2.0c", "lib", "TMHMM2.0.options"
  )
  testit::assert(file.exists(options_filename))
  lines <- readLines(options_filename)
  lines[which(lines == "PrintNumbers")] <- "#PrintNumbers #for tmhmm"
  lines[which(lines == "PrintScore")] <- "#PrintScore #for tmhmm"
  lines[which(lines == "PrintStat")] <- "#PrintStat #for tmhmm"
  lines[which(lines == "PrintSeq")] <- "#PrintSeq #for tmhmm"
  writeLines(text = lines, con = options_filename)
}
