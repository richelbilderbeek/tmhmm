#' Is the line of text the locatome, as used within
#' a FASTA filename?
#' @param line line of text from a FASTA filename
#' @examples
#' # A valid locatome line
#' is_locatome_line("oooooMMMMMiiiii")
#'
#' # An invalid locatome line
#' is_locatome_line("nonsense"))
#' @export
is_locatome_line <- function(line) {
  if (!is.character(line)) return(FALSE)
  if (nchar(line) == 0) return(FALSE)
  stringr::str_count(line, pattern = "(i|M|o)") == nchar(line)
}
