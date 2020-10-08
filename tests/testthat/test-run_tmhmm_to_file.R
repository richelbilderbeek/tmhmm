test_that("use", {
  if (!is_tmhmm_installed()) return()

  testthat::expect_true(is_tmhmm_installed())
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  tmhmm_filename <- tempfile()
  run_tmhmm_to_file(
    fasta_filename = fasta_filename,
    tmhmm_filename = tmhmm_filename
  )
  expect_true(file.exists(tmhmm_filename))
  fasta_text <- readLines(fasta_filename)
  tmhmm_text <- readLines(tmhmm_filename)
  expect_equal(length(fasta_text), length(tmhmm_text))
  # FASTA file uses 71 chars per line
  # TMHMM file uses 72 chars per line
  expect_equal(sum(nchar(fasta_text)), sum(nchar(tmhmm_text)))

})
