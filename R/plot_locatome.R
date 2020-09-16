#' Plot the locatome
#' @inheritParams default_params_doc
#' @export
plot_locatome <- function(locatome) {

  x <- NULL; rm(x) # nolint, fixes warning: no visible binding for global variable
  loc <- NULL; rm(loc) # nolint, fixes warning: no visible binding for global variable

  df_locatome <- tmhmm::locatome_to_df(locatome)

  n_locs <- sum(nchar(df_locatome$locatome))

  # Tidy
  df <- tibble::tibble(name = rep("", n_locs), x = -12.34, loc = "")

  row_index <- 1 # write to df

  for (i in seq(1, nrow(df_locatome))) {
    name <- stringr::str_split(
      string = df_locatome$name[i], pattern = " "
    )[[1]][1]
    locs <- df_locatome$locatome[i]
    n_locs <- nchar(locs)
    range <- row_index:(row_index + n_locs - 1)
    df$name[range] <- name
    df$x[range] <- seq(0, 1, length.out = n_locs)
    df$loc[range] <- strsplit(x = locs, split = "")[[1]]
    row_index <- row_index + n_locs
  }
  df$loc <- as.factor(df$loc)

  ggplot2::ggplot(df, ggplot2::aes(x = x, y = name, color = loc)) +
    ggplot2::geom_point() +
    ggplot2::xlab(
      "Relative position"
    )
}
