#' Run TMHMM on a FASTA file with one or more proteins.
#'
#' The function \link{run_tmhmm_on_one_protein_fasta_file}
#' is the function that actually calls TMHMM, on a per-protein basis.
#' @inheritParams default_params_doc
#' @return text similar to a FASTA file, yet with the
#'   predicted topology instead of the protein sequence
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_tmhmm_installed()) {
#'   fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#'   locatome <- run_tmhmm(fasta_filename)
#'   message(locatome, sep = "\n")
#' }
#' @export
run_tmhmm <- function(
  fasta_filename,
  one_protein_fasta_filename = tempfile(fileext = ".fasta"),
  folder_name = get_default_tmhmm_folder()
) {
  tmhmm::check_tmhmm_installation(folder_name = folder_name)

  # All sequences
  t <- pureseqtmr::load_fasta_file_as_tibble_cpp(fasta_filename)

  # List of all texts
  lists <- list()

  n_sequences <- nrow(t)

  for (i in seq_len(n_sequences)) {
    pureseqtmr::save_tibble_as_fasta_file(
      t = t[i, ],
      fasta_filename = one_protein_fasta_filename
    )
    text <- run_tmhmm_on_one_protein_fasta_file(
      one_protein_fasta_filename = one_protein_fasta_filename,
      folder_name = folder_name
    )
    lists[[i]] <- tibble::tibble(text = text)
  }

  all_text <- dplyr::bind_rows(lists)
  all_text$text
}
