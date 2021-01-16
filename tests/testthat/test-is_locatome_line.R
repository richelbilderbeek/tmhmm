test_that("use", {
  expect_warning(
    is_locatome_line("oooooMMMMMiiiii"),
    "'is_locatome_line' is deprecated, use 'is_topology_sequence' instead"
  )
})
