test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  locatome <- run_tmhmm(fasta_filename)
  expect_silent(plot_locatome(locatome))
})

test_that("use", {
  fasta_filename <- system.file("extdata", "example_2.fasta", package = "tmhmm")
  locatome <- run_tmhmm(fasta_filename)
  expect_silent(plot_locatome(locatome))
})