#' Plot the topology from text
#' @inheritParams default_params_doc
#' @examples
#' topology_text <- c(">Protein A", "iiiimmmmmooooo")
#' plot_topology_text(topology_text)
#' @export
plot_locatome <- function(locatome) {
  warning("'plot_locatome' is deprecated, use 'plot_topology_text' instead")
  tmhmm::plot_topology_text(locatome)
}
