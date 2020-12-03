test_that("use", {
  skip("Cannot test due to expiring download link")

  if (!is_on_ci()) return()

  if (is_tmhmm_installed()) {
    uninstall_tmhmm()
    expect_false(is_tmhmm_set_up())
    expect_false(is_tmhmm_installed())
    install_tmhmm(download_url = get_tmhmm_url())
    expect_true(is_tmhmm_installed())
  } else  {
    testthat::expect_true(!is_tmhmm_installed())
    install_tmhmm()
    expect_true(is_tmhmm_installed())
    uninstall_tmhmm()
    expect_false(is_tmhmm_installed())
  }

})

test_that("re-install must fails", {
  if (!is_tmhmm_installed()) return()
  expect_error(
    install_tmhmm_bin(),
    "TMHMM binary is already installed"
  )
})
