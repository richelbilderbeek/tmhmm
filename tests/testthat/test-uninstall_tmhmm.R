test_that("use", {
  if (!is_on_ci()) return()
  if (!curl::has_internet()) return()
  if (!is_url_valid()) return()

  if (is_tmhmm_installed()) {
    uninstall_tmhmm()
    expect_false(is_tmhmm_installed())
    install_tmhmm()
  } else {
    install_tmhmm()
    uninstall_tmhmm()
    expect_false(is_tmhmm_installed())
  }
})

test_that("uninstall absent TMHMM must throw", {
  if (!is_on_ci()) return()
  if (!curl::has_internet()) return()
  if (!is_url_valid()) return()

  expect_error(
    uninstall_tmhmm(folder_name = "absent"),
    "Cannot uninstall absent TMHMM at"
  )
})
