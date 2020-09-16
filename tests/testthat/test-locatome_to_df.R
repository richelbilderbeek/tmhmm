test_that("use", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  locatome <- run_tmhmm(fasta_filename)
  df <- locatome_to_df(locatome)
  expect_true("name" %in% names(df))
  expect_true("locatome" %in% names(df))
  expect_equal(1, nrow(df))
  expect_equal(2, ncol(df))
})

test_that("use", {

  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file(
    "extdata", "example_2.fasta", package = "tmhmm"
  )
  locatome <- run_tmhmm(fasta_filename)
  df <- locatome_to_df(locatome)
  expect_true("name" %in% names(df))
  expect_true("locatome" %in% names(df))
  expect_equal(10, nrow(df))
  expect_equal(2, ncol(df))
})
