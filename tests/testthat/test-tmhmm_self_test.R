test_that("use", {
  if (is_tmhmm_installed()) {
    expect_silent(tmhmm_self_test())
  } else {
    expect_error(tmhmm_self_test())
  }
})
