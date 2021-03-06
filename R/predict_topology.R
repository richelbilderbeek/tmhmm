#' Predict the topology of a membrane protein
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#'   and 'topology', where the 'name' column hold all the proteins' names,
#'   and 'topology' contains all respective topologies.
#' @examples
#' if (is_tmhmm_installed()) {
#'   fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
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
  t <- pureseqtmr::load_fasta_file_as_tibble(
    temp_topology_filename
  )
  file.remove(temp_topology_filename)

  dplyr::rename(t, topology = sequence)
}
