test_that("use", {
  expect_true(
    grepl(
      "tmhmm-2.0c/bin/tmhmm",
      get_default_tmhmm_bin_path()
    )
  )
})
