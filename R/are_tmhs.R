#' Are the sequences TMHs?
#' @inheritParams default_params_doc
#' @examples
#' if (is_tmhmm_installed()) {
#'
#'   sequences <- c(
#'     "VVIILTIAGNILVIMAVSLE",
#'     "VVIILTIRGNILVIMAVSLE"
#'   )
#'
#'   are_tmhs(sequences)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
are_tmhs <- function(protein_sequences) {
  tmhmm::check_tmhmm_installation()

  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- is_tmh(protein_sequences[i])
  }
  results
}

