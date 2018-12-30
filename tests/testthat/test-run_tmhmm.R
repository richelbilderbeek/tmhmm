context("test-run_tmhmm")

test_that("use", {
  fasta_file <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  df <- run_tmhmm(fasta_file)
  expect_true(is.data.frame(df))
})
