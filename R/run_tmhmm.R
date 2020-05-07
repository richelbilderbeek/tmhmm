#' Run TMHMM
#' @inheritParams default_params_doc
#' @return a character vector with the locatome
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' expect_true(is_tmhmm_installed())
#' fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#' locatome <- run_tmhmm(fasta_filename)
#' cat(locatome, sep = "\n")
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
  text <- system2(
    command = bin_path,
    args = c(
      "-f", options_path,
     "-modelfile", model_path
    ),
    stdout = TRUE,
    stderr = NULL,
    stdin = fasta_filename
  )
  text <- text[text != ""]
  stringr::str_remove(string = text, pattern = "^\\?0 ")
}
