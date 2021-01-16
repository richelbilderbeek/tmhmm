#' Run TMHMM directy on a protein sequence
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example \code{MEILCEDNTSLSSIPNSL}
#' @inheritParams default_params_doc
#' @return a topology sequence,
#'   for example \code{"iiiimmmmmoooo"}
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
predict_topology_from_sequence <- function(
  protein_sequence,
  folder_name = get_default_tmhmm_folder(),
  temp_fasta_filename = tempfile(fileext = ".fasta"),
  temp_topology_filename = tempfile(fileext = ".topo")
) {
  tmhmm::predict_topologies_from_sequences(
    protein_sequences = protein_sequence,
    folder_name = folder_name,
    temp_fasta_filename = temp_fasta_filename,
    temp_topology_filename = temp_topology_filename
  )
}
