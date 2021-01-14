test_that("use", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  expect_equal(
    nrow(pureseqtmr::load_fasta_file_as_tibble(fasta_filename)),
    1
  )
  text <- run_tmhmm_on_one_protein_fasta_file(fasta_filename)
  expect_true(length(text) >= 2)
})

test_that("abuse", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">broken portein", "?"), con = fasta_filename)
  expect_error(
    run_tmhmm_on_one_protein_fasta_file(fasta_filename),
    "Character '\\?' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
  )
})

test_that("abuse", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">empty protein", ""), con = fasta_filename)
  expect_error(
    run_tmhmm_on_one_protein_fasta_file(fasta_filename),
    "Protein sequence must have at least one character"
  )
})
