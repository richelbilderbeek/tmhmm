#' Parse a FASTA file to a table
#' with a \code{name} and \code{sequence} column
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#'   with a \code{name} and \code{sequence} column
#' @export
parse_fasta_file <- function(fasta_filename) {
  warning(
    "'parse_fasta_file' is deprecated, ",
    "use 'pureseqtmr::load_fasta_file_as_tibble_cpp' instead"
  )
  pureseqtmr::load_fasta_file_as_tibble_cpp(fasta_filename)
}
