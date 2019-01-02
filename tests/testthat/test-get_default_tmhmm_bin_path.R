context("test-get_default_tmhmm_bin_path")

test_that("use", {
  expect_true(
    grepl(
      "/home/[A-Za-z0-9_]*/.local/share/tmhmm-2.0c/bin/tmhmm", # nolint really test for absolute path
      get_default_tmhmm_bin_path()
    )
  )
})
