test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  tmhmm_filename <- tempfile()
  mock_run_tmhmm_to_file(
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

test_that("mock on big data", {
  # tmhmm file size must exceed 762914
  # number of sequences must exceed 1092
  sequences <- tibble::tibble(
    name = rep(letters[1:26], each = 100),
    sequence = paste0(rep("FAMILYVW", times = 100), collapse = "")
  )
  expect_true(nrow(sequences) > 1092 * 2)
  fasta_filename <- tempfile()
  pureseqtmr::save_tibble_as_fasta_file(
    t = sequences,
    fasta_filename = fasta_filename
  )
  expect_true(file.size(fasta_filename) > 762914 * 2)

  tmhmm_filename <- tempfile()

  local({
    local_mock(run_tmhmm = mock_run_tmhmm)

    mock_run_tmhmm_to_file(
      fasta_filename = fasta_filename,
      tmhmm_filename = tmhmm_filename
    )
  })
  expect_true(file.size(tmhmm_filename) > 762914 * 2)
  expect_equal(
    nrow(pureseqtmr::load_fasta_file_as_tibble(fasta_filename)),
    nrow(pureseqtmr::load_fasta_file_as_tibble(tmhmm_filename))
  )
})

test_that("Not all sequences get their topology predicted for bigger files?", {
  skip("Issue 4. Issue #4")
  if (!is_tmhmm_installed()) return()
  expect_true(is_tmhmm_installed())
  fasta_gz_filename <- tempfile(fileext = "_UP000005640_9606.fasta.gz")
  download.file(
    url = "ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/QfO/Eukaryota/UP000005640_9606.fasta.gz", # nolint indeed a long URL
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
    nrow(pureseqtmr::load_fasta_file_as_tibble(fasta_filename))
  )

  # The original file does not work
  expect_error(
    mock_run_tmhmm_to_file(
      fasta_filename = fasta_filename,
      tmhmm_filename = "irrelevant"
    ),
    "Character 'U' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
  )

  # Remove all proteins with a selenocysteine
  t <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  # Remove the Us
  t_no_u <- t[-stringr::str_which(string = t$sequence, pattern = "U"), ]
  nrow(t_no_u)
  fasta_no_u_filename <- "UP000005640_9606_no_u.fasta"
  pureseqtmr::save_tibble_as_fasta_file(
    t = t_no_u,
    fasta_filename = fasta_no_u_filename
  )

  tmhmm_filename <- tempfile(fileext = "UP000005640_9606_no_u.tmhmm")
  mock_run_tmhmm_to_file(
    fasta_filename = fasta_no_u_filename,
    tmhmm_filename = tmhmm_filename
  )

  expect_true(file.exists(tmhmm_filename))
  expect_equal(
    nrow(t_no_u),
    nrow(pureseqtmr::load_fasta_file_as_tibble(tmhmm_filename))
  )
})
