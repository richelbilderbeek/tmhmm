test_that("single protein", {
  if (!is_tmhmm_installed()) return()
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  topology <- predict_topology(fasta_filename)
  expect_silent(plot_topology(topology))
})
