#' Creates a FASTA-like file, that has the locations
#' of the amino acids.
#' @inheritParams default_params_doc
#' @examples
#' if (is_tmhmm_installed()) {
#'
#'   # Write results to a temporary file
#'   tmhmm_filename <- tempfile()
#'   run_tmhmm_to_file(
#'     fasta_filename = system.file("extdata", "tmhmm.fasta", package = "tmhmm"),
#'     tmhmm_filename = tmhmm_filename
#'   )
#'
#'   # Result is written to 'tmhmm_filename', cleaning up
#'   file.remove(tmhmm_filename)
#' }
#' @export
run_tmhmm_to_file <- function(
  fasta_filename,
  tmhmm_filename
) {
  writeLines(
    text = run_tmhmm(fasta_filename = fasta_filename),
    con = tmhmm_filename
  )
}