#' Is the topology sequence valid?
#' @param line a topology sequence
#' @examples
#' # A valid topology sequence
#' is_locatome_line("oooooMMMMMiiiii")
#'
#' # An invalid topology sequence
#' is_locatome_line("nonsense")
#' @export
is_locatome_line <- function(line) {
  warning(
    "'is_locatome_line' is deprecated, use 'is_topology_sequence' instead"
  )
  tmhmm::is_topology_sequence(line)
}
