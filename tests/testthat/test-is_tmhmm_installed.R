context("test-is_tmhmm_installed")


test_that("use", {
  if (!is_on_travis()) return()

  if (is_tmhmm_installed()) {
    uninstall_tmhmm()
    expect_false(is_tmhmm_installed())
    install_tmhmm(get_download_url())
    expect_true(is_tmhmm_installed())
  } else  {
    testit::assert(!is_tmhmm_installed())
    install_tmhmm()
    expect_true(is_tmhmm_installed())
    uninstall_tmhmm()
    expect_false(is_tmhmm_installed())
  }

})
