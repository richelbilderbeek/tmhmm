test_that("use", {
  topology_text <- c(">A", "i", ">B", "ii")
  expect_warning(
    plot_locatome(topology_text),
    "'plot_locatome' is deprecated, use 'plot_topology_text' instead"
  )
})
