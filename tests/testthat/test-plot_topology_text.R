test_that("one topology", {
  topology_text <- c(">Protein A", "iiiimmmmmooooo")
  expect_silent(plot_topology_text(topology_text))
})

test_that("two topologies", {
  topology_text <- c(">A", "iiiimmmmmooooo", ">B", "iiiiii")
  expect_silent(plot_topology_text(topology_text))
})
