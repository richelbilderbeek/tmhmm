#' Run TMHMM directy on a protein sequence
#' @inheritParams default_params_doc
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @return the locatome
#' @examples
#' if (is_tmhmm_intalled()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   locatome <- run_tmhmm_on_sequence(protein_sequence)
#' }
#' @export
run_tmhmm_on_sequence <- function(
  protein_sequence,
  folder_name = get_default_tmhmm_folder()
) {
  tmhmm::check_tmhmm_installation()

  fasta_filename <- tempfile()
  text <- c(">temp", protein_sequence)
  writeLines(text = text, con = fasta_filename)
  tmhmm::run_tmhmm(
    fasta_filename = fasta_filename,
    folder_name = folder_name
  )[2]
}
