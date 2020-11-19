#' Plot the topology
#' @inheritParams default_params_doc
#' @return a \link[ggplot2]{ggplot} that displays the topology of
#' one or more proteins
#' @examples
#' if (is_tmhmm_installed() && is_on_ci()) {
#'   fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#'   topology <- predict_topology(fasta_filename)
#'   plot_topology(topology)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
plot_topology <- function(topology) {

  x <- NULL; rm(x) # nolint, fixes warning: no visible binding for global variable
  loc <- NULL; rm(loc) # nolint, fixes warning: no visible binding for global variable

  n_locs <- sum(nchar(topology$topology))

  # Tidy
  df <- tibble::tibble(name = rep("", n_locs), x = -12.34, loc = "")

  row_index <- 1 # write to df

  for (i in seq(1, nrow(topology))) {
    name <- stringr::str_split(
      string = topology$name[i], pattern = " "
    )[[1]][1]
    locs <- topology$topology[i]
    n_locs <- nchar(locs)
    range <- row_index:(row_index + n_locs - 1)
    df$name[range] <- name
    df$x[range] <- seq(0, 1, length.out = n_locs)
    df$loc[range] <- strsplit(x = locs, split = "")[[1]]
    row_index <- row_index + n_locs
  }
  df$loc <- as.factor(df$loc)
  df$loc <- plyr::revalue(
    x = df$loc,
    replace = c("0" = "out", "1" = "in"),
    warn_missing = FALSE
  )

  ggplot2::ggplot(df, ggplot2::aes(x = x, y = name, color = loc)) +
    ggplot2::geom_point() +
    ggplot2::xlab("Relative position") +
    ggplot2::ylab("Protein name") +
    ggplot2::labs(
      color = "Location"
    )
}
