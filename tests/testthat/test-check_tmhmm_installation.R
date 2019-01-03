context("test-check_tmhmm_installation")

test_that("use", {

  # Locally, TMHMM is expected to be installed
  expect_silent(check_tmhmm_installation())

  if (!is_on_travis()) return()

  expect_error(
    check_tmhmm_installation(folder_name = "nonsense"),
    "TMHMM binary not found at location '"
  )

  # Only bin
  folder_name <- tempdir()
  install_tmhmm_bin(folder_name = folder_name)
  expect_error(
    check_tmhmm_installation(folder_name = folder_name),
    "TMHMM not set up completely"
  )

})
