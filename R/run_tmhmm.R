#' Run TMHMM
#' @inheritParams default_params_doc
#' @return a data frame
#' @author Richel J.C. Bilderbeek
#' @export
run_tmhmm <- function(
  fasta_filename,
  folder_name = get_default_tmhmm_folder() # nolint tmhmm function
) {
  bin_path <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  old_path <- Sys.getenv("PATH")
  path <- paste0(
    paste0(file.path(folder_name, "tmhmm-2.0c"), ":"),
    old_path
  )
  path <- paste0(
    paste0(file.path(folder_name, "tmhmm-2.0c", "bin"), ":"),
    path
  )
  path <- paste0(
    paste0(file.path(folder_name, "tmhmm-2.0c", "lib"), ":"),
    path
  )
  Sys.setenv(PATH = path)
  testit::assert(path = Sys.getenv("PATH"))

  text <- system2(
    command = bin_path,
    args = fasta_filename,
    stdout = TRUE
  )
  data.frame(lines = text)
  Sys.setenv(PATH = old_path)
  testit::assert(old_path = Sys.getenv("PATH"))
}