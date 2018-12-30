context("test-get_tmhmm_url")

test_that("use", {

  expect_equal(
    get_tmhmm_url(),
    "http://richelbilderbeek.nl/tmp_tmhmm-2.0c.Linux.tar.gz"
  )
})
