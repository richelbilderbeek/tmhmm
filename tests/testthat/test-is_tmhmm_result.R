test_that("deprecated", {
  expect_warning(
    is_tmhmm_result(c(">A", "imo")),
    "'is_tmhmm_result' is deprecated, use 'is_tmhmm_result' instead"
  )
})
