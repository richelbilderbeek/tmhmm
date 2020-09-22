#' Convert a multi-line locatome to a tidy data frame
#' @inheritParams default_params_doc
#' @export
locatome_to_df <- function(locatome) {

  n_names <- sum(stringr::str_detect(string = locatome, pattern = "^>"))
  df <- tibble::tibble(name = rep("", n_names), topology = "")

  # Put into table, row by row
  cur_row_index <- 0 # Line to write in data frame
  for (line in locatome) {
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
