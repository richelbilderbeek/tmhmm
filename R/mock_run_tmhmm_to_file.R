#' Mock \link{run_tmhmm_to_file}
#' @inheritParams default_params_doc
#' @examples
#' # Write results to a temporary file
#' tmhmm_filename <- tempfile()
#' run_tmhmm_to_file(
#'   fasta_filename = system.file(
#'     "extdata", "tmhmm.fasta", package = "tmhmm"
#'   ),
#'   tmhmm_filename = tmhmm_filename
#' )
#'
#' # Result is written to 'tmhmm_filename', cleaning up
#' file.remove(tmhmm_filename)
#' @export
mock_run_tmhmm_to_file <- function(
  fasta_filename,
  tmhmm_filename,
  one_protein_fasta_filename = "irrelevant",
  folder_name = "irrelevant"

) {
  writeLines(
    text = tmhmm::mock_run_tmhmm(
      fasta_filename = fasta_filename,
      one_protein_fasta_filename = one_protein_fasta_filename,
      folder_name  = folder_name
    ),
    con = tmhmm_filename
  )
}
