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
  dir.create(
    dirname(topology_filename),
    recursive = TRUE,
    showWarnings = FALSE
  )
  readr::write_lines(
    topology_text,
    topology_filename
  )
  t <- tmhmm::parse_fasta_file(topology_filename)

  dplyr::rename(t, topology = sequence)
}
