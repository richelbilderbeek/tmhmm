#' Is the text a topology text?
#' @inheritParams default_params_doc
#' @return TRUE if the text is a topology text
#' @examples
#' topology_text <- c(
#'   ">protein name",
#'   "ooooMMMMiiiii"
#' )
#' is_topology_text(topology_text)
#' @export
is_topology_text <- function(topology_text) {
  if (class(topology_text) != "character") return(FALSE)
  t <- tmhmm::fasta_text_to_tibble(topology_text)
  tmhmm::are_topology_sequences(t$topology)
}
