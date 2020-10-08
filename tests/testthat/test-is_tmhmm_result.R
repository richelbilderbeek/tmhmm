test_that("use, result from run", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  tmhmm_result <- run_tmhmm(fasta_filename)
  expect_true(is_tmhmm_result(tmhmm_result))
  expect_true(is_tmhmm_result(tmhmm_result[1:2]))
  expect_false(is_tmhmm_result(tmhmm_result[1]))
  expect_false(is_tmhmm_result(tmhmm_result[2]))
})

test_that("use, fake input", {
  expect_false(is_tmhmm_result(NA))
  expect_false(is_tmhmm_result(NULL))
  expect_false(is_tmhmm_result(""))
})
