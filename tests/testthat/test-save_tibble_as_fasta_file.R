test_that("use", {
  t <- tibble::tibble(
    name = c("1", "2"),
    sequence = c("A", "CG")
  )
  fasta_filename <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename)
  text <- readr::read_lines(fasta_filename)
  expect_equal(text[1], ">1")
  expect_equal(text[2], "A")
  expect_equal(text[3], ">2")
  expect_equal(text[4], "CG")
})
