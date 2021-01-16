#' Convert FASTA text to a tibble
#' @inheritParams default_params_doc
#' @examples
#' topology_text <- c(">Protein A", "iiiimmmmmooooo")
#' fasta_text_to_tibble(topology_text)
#' @export
fasta_text_to_tibble <- function(fasta_text) {
  n_names <- sum(stringr::str_detect(string = fasta_text, pattern = "^>"))
  df <- tibble::tibble(name = rep("", n_names), topology = "")

  # Put into table, row by row
  cur_row_index <- 0 # Line to write in data frame
  for (line in fasta_text) {
    if (stringr::str_detect(string = line, pattern = "^>")) {
      cur_row_index <- cur_row_index + 1
      df$name[cur_row_index] <- line
    } else {
      df$topology[cur_row_index] <- paste0(df$topology[cur_row_index], line)
    }
  }

  # Strip the '>' from the name
  df$name <- stringr::str_replace(df$name, pattern = ">", replacement = "")

  df
}
