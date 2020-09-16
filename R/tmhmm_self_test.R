#' Self-test the TMHMM installation
#'
#' @examples
#' if (is_tmhmm_installed()) {
#'   tmhmm_self_test()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
tmhmm_self_test <- function() {
  tmhmm::run_tmhmm_on_sequence(
    "AVLWAGVAFLAFLQLTALVLNLL"
  )
}
