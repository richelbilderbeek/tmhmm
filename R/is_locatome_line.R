#' Is the line of text the locatome, as used within
#' a FASTA filename?
#' @param line line of text from a FASTA filename
#' @examples
#' library(testthat)
#'
#' expect_true(is_locatome_line("oooooMMMMMiiiii"))
#' expect_false(is_locatome_line(">5H2A_CRIGR"))
#' expect_false(is_locatome_line("5H2A_CRIGR"))
#' expect_false(is_locatome_line(NA))
#' expect_false(is_locatome_line(NULL))
#' expect_false(is_locatome_line(""))
#' @export
is_locatome_line <- function(line) {
  if (!is.character(line)) return(FALSE)
  if (nchar(line) == 0) return(FALSE)
  stringr::str_count(line, pattern = "(i|M|o)") == nchar(line)
}
