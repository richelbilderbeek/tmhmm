#' Is the line of text the name of a protein, as used within
#' a FASTA filename?
#' @param line line of text from a FASTA filename
#' @examples
#' # A valid protein name line
#' is_protein_name_line(">5H2A_CRIGR")
#'
#' # An invalid protein name line:
#' # need the '>' before the protein name
#' is_protein_name_line("5H2A_CRIGR")
#'
#' # An invalid protein name line
#' is_protein_name_line("nonsense")
#' @export
is_protein_name_line <- function(line) {
  if (!is.character(line)) return(FALSE)
  substr(line, 1, 1) == ">"
}
