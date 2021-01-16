test_that("use", {
  fasta_text <- c(">Protein A", "FAMILYVW")
  t_topology <- fasta_text_to_tibble(fasta_text)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(1, nrow(t_topology))
})

test_that("two proteins", {
  fasta_text <- c(">Protein A", "FAMILYVW", ">Protein B", "VW")
  t_topology <- fasta_text_to_tibble(fasta_text)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(2, nrow(t_topology))
})

test_that("use", {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  locatome <- readr::read_lines(fasta_filename)
  t_topology <- fasta_text_to_tibble(locatome)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(2, nrow(t_topology))
  expect_equal(2, ncol(t_topology))

  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(t_fasta$name, t_topology$name)
  expect_equal(nchar(t_fasta$sequence), nchar(t_topology$topology))
})

test_that("use", {
  fasta_filename <- system.file(
    "extdata", "example_2.fasta", package = "tmhmm"
  )
  locatome <- readr::read_lines(fasta_filename)
  t_topology <- fasta_text_to_tibble(locatome)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(10, nrow(t_topology))
  expect_equal(2, ncol(t_topology))

  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(t_fasta$name, t_topology$name)
  expect_equal(nchar(t_fasta$sequence), nchar(t_topology$topology))
})
