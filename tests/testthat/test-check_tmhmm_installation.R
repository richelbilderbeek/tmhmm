context("test-check_tmhmm_installation")

test_that("use", {
  expect_silent(check_tmhmm_installation())
  expect_error(
    check_tmhmm_installation(folder_name = "nonsense"),
    "TMHMM binary not found at location '"
  )

})
