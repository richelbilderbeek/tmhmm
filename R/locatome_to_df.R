#' Convert a multi-line locatome to a tidy data frame
#' @inheritParams default_params_doc
#' @examples
#' topology_text <- c(">Protein A", "iiiimmmmmooooo")
#' fasta_text_to_tibble(topology_text)
#' @export
locatome_to_df <- function(topology_text, locatome = character(0)) {
  if  (length(locatome) != 0) {
    warning(
      "The argument name 'locatome' is deprecated, use 'topology_text' instead"
    )
    topology_text <- locatome
  }
  warning("'locatome_to_df' is deprecated, use 'fasta_text_to_tibble' instead")
  tmhmm::fasta_text_to_tibble(fasta_text = topology_text)
}
