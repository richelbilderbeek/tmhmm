#' Are all the one or more topology sequences valid?
#' @inheritParams default_params_doc
#' @examples
#' # Valid topology sequences
#' are_topology_sequences("oooooMMMMMiiiii")
#' are_topology_sequences(c("oooooMMMMMiiiii", "iiiii"))
#'
#' # Invalid topology sequences
#' are_topology_sequences("nonsense")
#' are_topology_sequences(c("oooooMMMMMiiiii", "nonsense"))
#' are_topology_sequences(c())
#' are_topology_sequences(NULL)
#' @export
are_topology_sequences <- function(topology_sequences) {
  if (length(topology_sequences) == 0) return(FALSE)
  sum(
    purrr::map_lgl(topology_sequences, tmhmm::is_topology_sequence)
  ) == length(topology_sequences)
}
