test_that("use", {

  if (!curl::has_internet()) return()
  if (!is_on_travis()) return()

  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  expect_error(
    install_tmhmm_bin(download_url = "invalid", folder_name = folder_name),
    "download_url' is invalid."
  )
})
