#' Run TMHMM
#' @inheritParams default_params_doc
#' @return a character vector with the locatome
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_tmhmm_installed()) {
#'   fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#'   locatome <- run_tmhmm(fasta_filename)
#'   cat(locatome, sep = "\n")
#' }
#' @export
run_tmhmm <- function(
  fasta_filename,
  folder_name = get_default_tmhmm_folder() # nolint tmhmm function
) {
  tmhmm::check_tmhmm_installation()

  bin_path <- file.path(
    folder_name, "tmhmm-2.0c", "bin", "decodeanhmm.Linux_x86_64"
  )
  options_path <- file.path(
    folder_name, "tmhmm-2.0c", "lib", "TMHMM2.0.options"
  )
  model_path <- file.path(
    folder_name, "tmhmm-2.0c", "lib", "TMHMM2.0.model"
  )
  cmds <- c("-f", options_path, "-modelfile", model_path)
  text <- NA
  suppressWarnings(
    text <- system2(
      command = bin_path,
      args = cmds,
      stdout = TRUE,
      stderr = NULL,
      stdin = fasta_filename
    )
  )
  if (length(text) == 0) {
    testthat::expect_equal(attr(text, "status"), 100)
    suppressWarnings(
      text <- system2(
        command = bin_path,
        args = cmds,
        stdout = NULL,
        stderr = TRUE,
        stdin = fasta_filename
      )
    )
    stop(text[6])
  }
  text <- text[text != ""]
  stringr::str_remove(string = text, pattern = "^\\?0 ")
}
