test_that("use", {
  testit::assert(is_tmhmm_installed())
  tmhmm_filename <- tempfile()
  run_tmhmm_to_file(
    fasta_filename = system.file("extdata", "tmhmm.fasta", package = "tmhmm"),
    tmhmm_filename = tmhmm_filename
  )
  expect_true(file.exists(tmhmm_filename))
  readLines(tmhmm_filename)
})
