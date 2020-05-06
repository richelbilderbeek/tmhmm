#' Run TMHMM directy on a protein sequence
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @return the locatome
#' @examples
#' protein_sequence <- paste0(
#'   "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'   "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#' )
#' locatome <- run_tmhmm_on_sequence(protein_sequence)
#' expected_locatome <- paste0(
#'   "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooooooooooo",
#'   "MMMMMMMMMMMMMMMMMMMMMMMiiiii"
#' )
#' expect_equal(locatome, expected_locatome)
#' @export
run_tmhmm_on_sequence <- function(protein_sequence) {
  tmhmm::check_tmhmm_installation()

  filename <- tempfile()
  text <- c(">temp", protein_sequence)
  writeLines(text = text, con = filename)
  run_tmhmm(filename)[2]
}
