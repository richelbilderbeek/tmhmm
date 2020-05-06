test_that("use", {
  if (!is_tmhmm_installed()) return()
  sequences <- c("VVIILTIAGNILVIMAVSLE", "VVIILTIRGNILVIMAVSLE")
  expect_equal(c(TRUE, FALSE), are_tmhs(sequences))
})
