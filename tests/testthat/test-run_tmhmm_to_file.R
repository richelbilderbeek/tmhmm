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

test_that("Not all sequences get their topology predicted for bigger files?", {
  skip("Issue 4. Issue #4")
  if (!is_tmhmm_installed()) return()
  expect_true(is_tmhmm_installed())
  fasta_gz_filename <- tempfile(fileext = "_UP000005640_9606.fasta.gz")
  download.file(
    url = "ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Eukaryota/UP000005640_9606.fasta.gz",
    destfile = fasta_gz_filename
  )
  fasta_filename <- tempfile(fileext = "_UP000005640_9606.fasta")
  R.utils::gunzip(
    filename = fasta_gz_filename,
    destname = fasta_filename,
    remove = FALSE
  )
  expect_true(file.exists(fasta_filename))
  # We know this reference proteome has 20600 proteins
  expect_equal(
    20600,
    nrow(pureseqtmr::load_fasta_file_as_tibble_cpp(fasta_filename))
  )
  tmhmm_filename <- tempfile(fileext = "_UP000005640_9606.tmhmm")

  # The original file does not work
  expect_error(
    run_tmhmm_to_file(
      fasta_filename = fasta_filename,
      tmhmm_filename = tmhmm_filename
    ),
    "Character 'U' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'."
  )


  skip("HIERO")
  # Remove the sequences with U
  t <- pureseqtmr::load_fasta_file_as_tibble_cpp()

  expect_true(file.exists(tmhmm_filename))
  expect_equal(
    20600,
    nrow(pureseqtmr::load_fasta_file_as_tibble_cpp(tmhmm_filename))
  )
})
