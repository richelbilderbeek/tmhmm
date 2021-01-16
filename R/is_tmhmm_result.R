#' Is the text a TMHMM result text?
#' @inheritParams default_params_doc
#' @return TRUE if the text is a TMHMM result text
#' @examples
#' tmhmm_result <- c(
#'   ">protein name",
#'   "ooooMMMMiiiii"
#' )
#' is_topology_text(topology_text = tmhmm_result)
#' @export
is_tmhmm_result <- function(tmhmm_result) {
  warning("'is_tmhmm_result' is deprecated, use 'is_tmhmm_result' instead")
  tmhmm::is_topology_text(tmhmm_result)
}
