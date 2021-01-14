test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  expect_warning(
    parse_fasta_file(fasta_filename),
    paste0(
      "'parse_fasta_file' is deprecated, ",
      "use 'pureseqtmr::load_fasta_file_as_tibble_cpp' instead"
    )
  )
})