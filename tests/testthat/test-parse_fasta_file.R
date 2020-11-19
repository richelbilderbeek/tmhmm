test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  t <- parse_fasta_file(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_equal(1, nrow(t))
  expect_true(all(!is.na(t$sequence)))
})

test_that("use", {
  fasta_filename <- system.file(
    "extdata", "UP000464024.fasta",
    package = "tmhmm"
  )
  readLines(fasta_filename)
  t <- parse_fasta_file(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_equal(14, nrow(t))
  expect_true(all(!is.na(t$sequence)))
})
