test_that("use", {
  if (!is_on_travis()) return()
  if (!curl::has_internet()) return()
  if (!is_url_valid()) return()

  if (is_tmhmm_installed()) {
    uninstall_tmhmm()
    install_tmhmm()
    expect_true(is_tmhmm_installed())
  } else {
    install_tmhmm()
    expect_true(is_tmhmm_installed())
    uninstall_tmhmm()
  }
})
