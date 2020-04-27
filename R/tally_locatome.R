#' Tally each location in a locatome
#' @inheritParams default_params_doc
#' @export
tally_locatome <- function(
  locatome
) {
  chars <- strsplit(locatome, split = "")[[1]]
  locations <- unique(chars)
  n_locations <- length(locations)
  counts <- rep(0, n_locations)
  for (i in seq(1, n_locations)) {
    counts[i] <- sum(chars == locations[i])
  }
  tally <- tibble::tibble(
    location = locations,
    count = counts
  )
  tally$location <- as.factor(tally$location)
  tally
}
