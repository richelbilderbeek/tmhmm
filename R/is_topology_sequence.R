#' Is the topology sequence valid?
#' @inheritParams default_params_doc
#' @examples
#' # A valid topology sequence
#' is_topology_sequence("oooooMMMMMiiiii")
#'
#' # An invalid topology sequence
#' is_topology_sequence("nonsense")
#' @export
is_topology_sequence <- function(topology_sequence) {
  if (!is.character(topology_sequence)) return(FALSE)
  if (nchar(topology_sequence) == 0) return(FALSE)
  stringr::str_count(
    topology_sequence,
    pattern = "(i|M|o)"
  ) == nchar(topology_sequence)
}
