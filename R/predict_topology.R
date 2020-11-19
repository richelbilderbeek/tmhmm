#' Predict the topology of a membrane protein
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#'   and 'topology', where the 'name' column hold all the proteins' names,
#'   and 'topology' contains all respective topologies.
#' @param temp_topology_filename filename to temporarily
#'   save the topology. This file will be deleted when this
#'   function completed successfully
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
  temp_topology_filename = tempfile(fileext = ".top")
) {
  topology_text <- tmhmm::run_tmhmm(
    fasta_filename,
    folder_name = folder_name
  )
  dir.create(
    dirname(temp_topology_filename),
    recursive = TRUE,
    showWarnings = FALSE
  )
  readr::write_lines(
    topology_text,
    temp_topology_filename
  )
  t <- tmhmm::parse_fasta_file(temp_topology_filename)
  file.remove(temp_topology_filename)

  dplyr::rename(t, topology = sequence)
}
