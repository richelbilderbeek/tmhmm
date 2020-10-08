#' Run TMHMM directy on a protein sequence
#'
#' Run TMHMM directy on one protein sequence
#' @inheritParams default_params_doc
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @return the topology. The topology is a character string
#'   with the same length as the
#'   protein sequence. The topology consists of the characters
#'   \code{i} ('inside'), \code{I} ('inside'),
#'   \code{m} ('membrane'), \code{M} ('membrane'),
#'   \code{o} ('outside') and \code{O} ('outside')
#' @examples
#' if (is_tmhmm_intalled()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   run_tmhmm_on_sequence(protein_sequence)
#' }
#' @export
run_tmhmm_on_sequence <- function(
  protein_sequence,
  folder_name = get_default_tmhmm_folder()
) {
  if (length(protein_sequence) != 1) {
    stop(
      "'protein_sequence' must be one sequence. \n",
      "Actual length: ", length(protein_sequence)
    )
  }
  if (!is.character(protein_sequence)) {
    stop(
      "'protein_sequence' must be one character sequence. \n",
      "Actual type: ", class(protein_sequence)
    )
  }
  if (nchar(protein_sequence) == 0) {
    stop("'protein_sequence' must have at least one character")
  }
  tmhmm::check_tmhmm_installation()

  fasta_filename <- tempfile()
  text <- c(">temp", protein_sequence)
  readr::write_lines(text, path = fasta_filename)
  multi_line_topology <- tmhmm::run_tmhmm(
    fasta_filename = fasta_filename,
    folder_name = folder_name
  )[-1]
  paste0(multi_line_topology, collapse = "")
}
