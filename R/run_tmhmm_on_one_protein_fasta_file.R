#' Run TMHMM on a FASTA file with one protein
#'
#' This is the function that actually calls TMHMM.
#' The usage of TMHMM us split up per protein, as R cannot
#' handle communication via \code{stdin} that is too long,
#' hence, bigger FASTA files get truncated, and a topology of
#' less proteins is returned.
#'
#' Use \link{run_tmhmm} to call TMHMM with a FASTA file with multiple lines.
#' @inheritParams default_params_doc
#' @return text similar to a FASTA file, yet with the
#'   predicted topology instead of the protein sequence
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_tmhmm_installed()) {
#'   one_protein_fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#'   topology_text <- run_tmhmm(one_protein_fasta_filename)
#'   message(topology_text, sep = "\n")
#' }
#' @export
run_tmhmm_on_one_protein_fasta_file <- function(
  one_protein_fasta_filename,
  folder_name = get_default_tmhmm_folder()
) {
  tmhmm::check_tmhmm_installation(folder_name = folder_name)
  n_proteins <- nrow(
    pureseqtmr::load_fasta_file_as_tibble(one_protein_fasta_filename)
  )
  if (n_proteins != 1) {
    stop(
      "FASTA file '", one_protein_fasta_filename, "' must have 1 protein. ",
      "Actual number: ", n_proteins, ". ",
      "Tip: use 'run_tmhmm' instead of 'run_tmhmm_on_one_protein_fasta_file'"
    )
  }
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
  suppressWarnings({
    text <- system2(
      command = bin_path,
      args = cmds,
      stdout = TRUE,
      stderr = NULL,
      stdin = one_protein_fasta_filename
    )
  })
  if (length(text) == 0) {
    if (is.null(attr(text, "status"))) {
      stop("Protein sequence must have at least one character")
    }
    testthat::expect_equal(attr(text, "status"), 100)
    suppressWarnings({
      text <- system2(
        command = bin_path,
        args = cmds,
        stdout = NULL,
        stderr = TRUE,
        stdin = one_protein_fasta_filename
      )
    })
    stop(text[6])
  }
  text <- text[text != ""]
  stringr::str_remove(string = text, pattern = "^\\?0 ")
}
