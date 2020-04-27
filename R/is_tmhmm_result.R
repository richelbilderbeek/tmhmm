#' Is the text a locatome text, as would be in a FASTA file?
#' @export
is_tmhmm_result <- function(tmhmm_result) {
  if (class(tmhmm_result) != "character") return(FALSE)
  # Must alternate between lines with '>' and a sequence of iMo
  n_lines <- length(tmhmm_result)
  state <- "need_name"
  for (i in seq(1, n_lines))
  {
    line <- tmhmm_result[i]
    if (state == "need_name") {
      if (!is_protein_name_line(line)) return(FALSE)
      state <- "need_sequence"
    } else if (state == "need_sequence") {
      if (!is_locatome_line(line)) {
        return(FALSE)
      }
      state <- "need_name_or_sequence"
    } else if (state == "need_name_or_sequence") {
        if (is_protein_name_line(line)) {
          state <- "need_sequence"
        } else if (is_locatome_line(line)) {
          # Just continue
        } else {
          return(FALSE)
        }
    }
  }
  state == "need_name_or_sequence"
}
