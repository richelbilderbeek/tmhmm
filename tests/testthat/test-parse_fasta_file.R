test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  t <- parse_fasta_file(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_equal(1, nrow(t))
  expect_true(all(!is.na(t$sequence)))
})

test_that("detailed use", {
  text <- c(
    ">1",
    "A",
    ">2",
    "CG"
  )
  fasta_filename <- tempfile()
  readr::write_lines(x = text, file = fasta_filename)
  t <- parse_fasta_file(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_equal(t$name[1], "1")
  expect_equal(t$name[2], "2")
  expect_equal(t$sequence[1], "A")
  expect_equal(t$sequence[2], "CG")
})

test_that("SARS-CoV-2", {
  fasta_filename <- system.file(
    "extdata", "UP000464024.fasta",
    package = "tmhmm"
  )
  t <- parse_fasta_file(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_equal(14, nrow(t))
  expect_true(all(!is.na(t$sequence)))
})
