#' Predict the topology of a membrane protein
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'topology', where the 'name' column hold all the proteins' names,
#' and 'topology' contains all respective topologies.
#' @examples
#' if (is_tmhmm_installed()) {
#'   fasta_filename <- get_example_filename("tmhmm.fasta")
#'   predict_topology(fasta_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_topology <- function(
  fasta_filename,
  folder_name = get_default_tmhmm_folder(),
  topology_filename = tempfile(fileext = ".top")
) {
  topology_text <- tmhmm::run_tmhmm(
    fasta_filename,
    folder_name = folder_name
  )

  readr::write_lines(
    topology_text,
    topology_filename
  )
  beautier::fasta_file_to_sequences(topology_filename)
  sequences <- seqinr::read.fasta(file = topology_filename)

  # Only select the lines that have a gene name and a topolgy
  n_lines <- length(topology_text)
  testthat::expect_equal(n_lines %% 3, 0)
  gene_line_indices <- seq(from = 1, to = n_lines, by = 3)
  topology_line_indices <- seq(from = 3, to = n_lines, by = 3)
  testthat::expect_equal(
    length(gene_line_indices), length(topology_line_indices)
  )

  tibble::tibble(
    name = substring(topology_text[gene_line_indices], 2),
    topology = topology_text[topology_line_indices]
  )
}
