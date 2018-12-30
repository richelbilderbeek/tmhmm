context("test-is_tmhmm_set_up")

test_that("use", {
  if (!is_tmhmm_set_up()) set_up_tmhmm()
  expect_true(is_tmhmm_set_up())
})
