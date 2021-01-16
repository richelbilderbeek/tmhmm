test_that("use", {
  topology_text <- c(">Protein A", "FAMILYVW")
  expect_warning(
    locatome_to_df(topology_text = topology_text),
    "'locatome_to_df' is deprecated, use 'fasta_text_to_tibble' instead"
  )
  expect_warning(
    locatome_to_df(topology_text = topology_text, locatome = topology_text),
    "The argument name 'locatome' is deprecated, use 'topology_text' instead"
  )
})
