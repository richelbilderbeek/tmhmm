#' Determine if the protein sequence contains at least one TMH.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' expect_true(is_tmh("VVIILTIAGNILVIMAVSLE"))
#' expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
#' @export
is_tmh <- function(protein_sequence) {
  tmhmm::check_tmhmm_installation()

  locatome <- tmhmm::run_tmhmm_on_sequence(protein_sequence)
  stringr::str_count(string = locatome, pattern = "(M|m)") > 0
}
