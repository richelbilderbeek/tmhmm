test_that("error when two proteins", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "example.fasta", package = "tmhmm")
  expect_equal(1, nrow(pureseqtmr::load_fasta_file_as_tibble(fasta_filename)))
  t_topology <- fasta_text_to_tibble(
    run_tmhmm_on_one_protein_fasta_file(
      one_protein_fasta_filename = fasta_filename
    )
  )

  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(t_fasta$name, t_topology$name)
  expect_equal(nchar(t_fasta$sequence), nchar(t_topology$topology))
})

test_that("error when two proteins", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  expect_equal(
    nrow(pureseqtmr::load_fasta_file_as_tibble(fasta_filename)),
    2
  )
  expect_error(
    run_tmhmm_on_one_protein_fasta_file(
      one_protein_fasta_filename = fasta_filename
    ),
    "FASTA file '.*tmhmm.fasta' must have 1 protein. Actual number: 2."
  )
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
