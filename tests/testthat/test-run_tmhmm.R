test_that("use", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  text <- run_tmhmm(fasta_filename)
  expect_true(length(text) >= 2)
})

test_that("use on multiple proteins", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "example_2.fasta", package = "tmhmm")
  text <- run_tmhmm(fasta_filename)
  expect_true(length(text) >= 2)
})

test_that("abuse", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">broken portein", "?"), con = fasta_filename)
  expect_error(
    run_tmhmm(fasta_filename),
    "Character '\\?' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
  )
})

test_that("abuse", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">empty protein", ""), con = fasta_filename)
  expect_error(
    run_tmhmm(fasta_filename),
    "Protein sequence must have at least one character"
  )
})
