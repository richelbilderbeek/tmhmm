#' Mock \link{run_tmhmm}
#' @inheritParams default_params_doc
#' @return the topology as text, in a similar form as a FASTA file,
#'   for example \code{c(">Protein A", "iiiimmmmmoooo")}.
#'   Use \link{predict_topology} to get the same result
#'   in the form of a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @examples
#' fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#' topology_text <- mock_run_tmhmm(fasta_filename)
#' cat(topology_text, sep = "\n")
#' @export
mock_run_tmhmm <- function(
  fasta_filename,
  one_protein_fasta_filename = "ignored",
  folder_name = "ignored"
) {
  t <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)

  if (any(stringr::str_length(t$sequence) == 0)) {
    stop("Protein sequence must have at least one character")
  }

  # Names
  n_proteins <- nrow(t)
  text <- rep(NA, times = n_proteins * 2)
  name_indices <- seq(from = 1, by = 2, length.out = n_proteins)
  text[name_indices] <- paste0(">", t$name)

  # Sequences
  for (i in seq_len(n_proteins)) {
    text[0 + (i * 2)] <- tmhmm::mock_predict_topology_from_sequence(
      t$sequence[i]
    )
  }
  text
}
