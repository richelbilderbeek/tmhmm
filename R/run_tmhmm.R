#' Run TMHMM
#' @inheritParams default_params_doc
#' @return a character vector with the locatome
#' @author Richel J.C. Bilderbeek
#' @export
run_tmhmm <- function(
  fasta_filename,
  folder_name = get_default_tmhmm_folder() # nolint tmhmm function
) {
  check_tmhmm_installation() # nolint tmhmm function
  testit::assert(is_tmhmm_installed()) # nolint tmhmm function
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
