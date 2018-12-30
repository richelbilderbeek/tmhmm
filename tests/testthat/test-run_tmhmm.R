context("test-run_tmhmm")

test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  df <- run_tmhmm(fasta_filename)
  expect_true(is.data.frame(df))
})
