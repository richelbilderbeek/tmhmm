test_that("use", {
  sequences <- c("VVIILTIAGNILVIMAVSLE", "VVIILTIRGNILVIMAVSLE")
  expect_equal(c(TRUE, FALSE), are_tmhs(sequences))
})
