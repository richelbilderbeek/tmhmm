#' Determine if the protein sequence contains at least one TMH.
#' @inheritParams default_params_doc
#' @examples
#' if (is_tmhmm_installed()) {
#'   # A TMH
#'   is_tmh("VVIILTIAGNILVIMAVSLE")
#'
#'   # A protein without a TMH
#'   is_tmh("VVIILTIRGNILVIMAVSLE")
#' }
#' @export
is_tmh <- function(protein_sequence) {
  tmhmm::check_tmhmm_installation()

  locatome <- tmhmm::run_tmhmm_on_sequence(protein_sequence)
  stringr::str_count(string = locatome, pattern = "(M|m)") > 0
}
