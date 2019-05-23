#' Creates a FASTA-like file, that has the locations
#' of the amino acids.
#' @inheritParams default_params_doc
#' @examples
#' testit::assert(is_tmhmm_installed())
#' tmhmm_filename <- tempfile()
#' run_tmhmm_to_file(
#'   fasta_filename = system.file("extdata", "tmhmm.fasta", package = "tmhmm"),
#'   tmhmm_filename = tmhmm_filename
#' )
#' expect_true(file.exists(tmhmm_filename))
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