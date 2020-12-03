test_that("use", {
  if (!is_on_ci()) return()
  if (!curl::has_internet()) return()
  if (!is_url_valid()) return()

  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  expect_error(
    install_tmhmm_bin(download_url = "invalid", folder_name = folder_name),
    "download_url' is invalid."
  )
})
