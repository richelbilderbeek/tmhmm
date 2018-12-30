#' Install NetMHC2pan to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_tmhmm <- function(
  download_url = NULL,
  folder_name = get_default_tmhmm_folder(),
  verbose = FALSE
) {
  is_bin_installed <- is_tmhmm_bin_installed( # nolint tmhmm function
    folder_name = folder_name
  )
  if (!is_bin_installed) {
    install_tmhmm_bin( # nolint tmhmm function
      download_url = download_url,
      folder_name = folder_name,
      verbose = verbose
    )
  }
  is_set_up <- is_tmhmm_set_up( # nolint tmhmm function
    folder_name = folder_name
  )
  if (!is_set_up) {
    set_up_tmhmm( # nolint tmhmm function
      folder_name = folder_name
    )
  }
}

#' Install the NetMHC2pan binary to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_tmhmm_bin <- function(
  download_url = get_download_url(), # nolint tmhmm function
  folder_name = rappdirs::user_data_dir(),
  verbose = FALSE
) {
  bin_path <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  if (file.exists(bin_path)) {
    stop("TMHMM binary is already installed")
  }

  dir.create(path = folder_name, showWarnings = FALSE, recursive = TRUE)

  archive_filename <- "tmhmm-2.0c.Linux.tar.gz"
  url <- file.path(download_url)
  if (verbose == TRUE) {
    print(paste("Download from URL:", url))
  }
  local_path <- file.path(folder_name, archive_filename)
  tryCatch(
    utils::download.file(
      url = url,
      destfile = local_path
    ),
    error = function(e) {
      stop(
        "'download_url' is invalid.\n",
        "URL:", url, "\n",
        "Request a download URL at the TMHMM request page at\n",
        "\n",
        "http://www.cbs.dtu.dk/services/TMHMM/\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
    }
  )

  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(folder_name),
    verbose = verbose
  )
  if (verbose == TRUE) {
    print(paste("TMHMM installed at", bin_path))
  }
  testit::assert(file.exists(bin_path))
}
