test_that("use", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  text <- run_tmhmm(fasta_filename)
  expect_true(length(text) >= 2)
})
