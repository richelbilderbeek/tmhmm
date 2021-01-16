test_that("use", {
  if (!is_tmhmm_installed()) return()
  protein_sequences <- c(
    "FAMILYVWFAMILYVW",
    "FAMILYVWFAMILY"
  )
  topologies <- predict_topologies_from_sequences(
    protein_sequences = protein_sequences
  )
  expect_equal(length(protein_sequences), length(topologies))
  expect_equal(nchar(protein_sequences), nchar(topologies))
})
