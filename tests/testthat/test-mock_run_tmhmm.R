test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  text <- mock_run_tmhmm(fasta_filename)
  expect_true(length(text) >= 2)
})

test_that("use on multiple proteins", {
  fasta_filename <- system.file("extdata", "example_2.fasta", package = "tmhmm")
  text <- mock_run_tmhmm(fasta_filename)
  expect_true(length(text) >= 2)
})

test_that("abuse", {
  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">broken portein", "?"), con = fasta_filename)
  expect_error(
    mock_run_tmhmm(fasta_filename),
    "Character '\\?' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
  )
})

test_that("selenoprotein", {
  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">selenoprotein", "U"), con = fasta_filename)
  expect_error(
    mock_run_tmhmm(fasta_filename),
    "Character 'U' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
  )
})

test_that("abuse", {
  fasta_filename <- tempfile(fileext = ".fasta")
  writeLines(text = c(">empty protein", ""), con = fasta_filename)
  expect_error(
    mock_run_tmhmm(fasta_filename),
    "Protein sequence must have at least one character"
  )
})
