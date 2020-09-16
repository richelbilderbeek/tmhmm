#' Is the text a TMHMM result text?
#'
#' Is the text a TMHMM result text?
#'
#' A TMHMM result text, is similar to a regular FASTA file: it shows the
#' protein names and the locations of the amino acids (instead of the amino
#' acids).
#'
#' Here is an example of a TMHMM result text:
#'
#' \verb{
#'   >protein name
#'   oMMiii
#' }
#'
#' In this example, \code{protein name} is the name of the protein.
#' The protein consists out of 6 amino acids, of which the first
#' is located outside the cell, the next two are in the membrane,
#' and the last three are inside the (cytosol of) the cell. Note that
#' this is a biologically impossible protein: it takes around 21 amino
#' acids to span the lipid membane.
#' @inheritParams default_params_doc
#' @return TRUE if the text is a TMHMM result text
#' @examples
#' tmhmm_result <- c(
#'   ">protein name",
#'   "ooooMMMMiiiii"
#' )
#' is_tmhmm_result(tmhmm_result)
#' @export
is_tmhmm_result <- function(tmhmm_result) { # nolint indeed a complex function, no idea how to simplify it
  if (class(tmhmm_result) != "character") return(FALSE)
  # Must alternate between lines with '>' and a sequence of iMo
  n_lines <- length(tmhmm_result)
  state <- "need_name"
  for (i in seq(1, n_lines)) {
    line <- tmhmm_result[i]
    if (state == "need_name") {
      if (!tmhmm::is_protein_name_line(line)) return(FALSE)
      state <- "need_sequence"
    } else if (state == "need_sequence") {
      if (!tmhmm::is_locatome_line(line)) {
        return(FALSE)
      }
      state <- "need_name_or_sequence"
    } else if (state == "need_name_or_sequence") {
        if (tmhmm::is_protein_name_line(line)) {
          state <- "need_sequence"
        } else if (tmhmm::is_locatome_line(line)) {
          # Just continue
        } else {
          return(FALSE)
        }
    }
  }
  state == "need_name_or_sequence"
}
