#' Run TMHMM directy on a protein sequence
#' @inheritParams default_params_doc
#' @return one or more topology sequences,
#'   for example \code{c("iiiimmmmooooo", "iiiii")}
#' @seealso use \link{mock_predict_topologies_from_sequences}
#' to mock the prediction of protein sequences, as can be useful
#' in testing
#' @examples
#' if (is_tmhmm_installed()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   predict_topology_from_sequence(protein_sequence)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_topologies_from_sequences <- function(# nolint indeed a long function name
  protein_sequences,
  folder_name = get_default_tmhmm_folder(),
  temp_fasta_filename = tempfile(fileext = ".fasta"),
  temp_topology_filename = tempfile(fileext = ".topo")
) {
  t_sequences <- tibble::tibble(
    name = paste0("protein_", seq_along(protein_sequences)),
    sequence = protein_sequences
  )
  pureseqtmr::save_tibble_as_fasta_file(
    t = t_sequences,
    fasta_filename = temp_fasta_filename
  )
  t_topologies <- tmhmm::predict_topology(
    fasta_filename = temp_fasta_filename,
    folder_name = folder_name,
    temp_topology_filename = temp_topology_filename
  )
  file.remove(temp_fasta_filename)
  t_topologies$topology
}
