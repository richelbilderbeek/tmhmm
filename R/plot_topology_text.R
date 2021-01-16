#' Plot the topology from text
#' @inheritParams default_params_doc
#' @examples
#' topology_text <- c(">Protein A", "iiiimmmmmooooo")
#' plot_topology_text(topology_text)
#' @export
plot_topology_text <- function(topology_text) {
  tmhmm::plot_topology(topology = tmhmm::fasta_text_to_tibble(topology_text))
}
