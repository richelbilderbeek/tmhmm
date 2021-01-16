test_that("use", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  t_topology <- predict_topology(fasta_filename)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(2, nrow(t_topology))

  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(t_fasta$name, t_topology$name)
  expect_equal(nchar(t_fasta$sequence), nchar(t_topology$topology))
})
