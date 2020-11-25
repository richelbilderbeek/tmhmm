#' Save the first two columns of a tibble as a FASTA file
#' @export
save_tibble_as_fasta_file <- function(t, fasta_filename) {
  fasta_text <- rep(NA, nrow(t) * 2)
  fasta_text[seq(1, (nrow(t) * 2) - 1, by = 2)] <-
    paste0(">", unlist(dplyr::select(t, 1), use.names = FALSE))
  fasta_text[seq(2, (nrow(t) * 2) - 0, by = 2)] <-
    unlist(dplyr::select(t, 2), use.names = FALSE)
  readr::write_lines(x = fasta_text, file = fasta_filename)
}
