test_that("use", {
  expect_true(is_tmh("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
})
