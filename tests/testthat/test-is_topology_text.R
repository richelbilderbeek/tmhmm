test_that("use, result from run", {
  if (!is_tmhmm_installed()) return()

  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  topology_text <- run_tmhmm(fasta_filename)
  expect_true(is_topology_text(topology_text))
  expect_true(is_topology_text(topology_text[1:2]))
  expect_false(is_topology_text(topology_text[1]))
  expect_false(is_topology_text(topology_text[2]))
})

test_that("use, fake input", {
  expect_false(is_topology_text(NA))
  expect_false(is_topology_text(NULL))
  expect_false(is_topology_text(""))
})
