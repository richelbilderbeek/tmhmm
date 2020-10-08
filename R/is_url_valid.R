#' Is the download URL valid?
#'
#' The download link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
is_url_valid <- function(
  download_url = get_tmhmm_url()
) {
  url <- download_url
  local_path <- tempfile()
  is_valid <- FALSE
  tryCatch({
      suppressWarnings(
        utils::download.file(
          url = url,
          destfile = local_path,
          quiet = TRUE
        )
      )
      is_valid <- TRUE
      file.remove(local_path)
    },
    error = function(e) {} # nolint ignore error
  )
  is_valid
}
