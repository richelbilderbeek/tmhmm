test_that("use", {
  if (!is_tmhmm_installed()) return()

  expect_true(is_tmh("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
})
