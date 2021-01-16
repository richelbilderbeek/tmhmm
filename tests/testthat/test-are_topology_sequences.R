test_that("use", {
  expect_true(
    are_topology_sequences(
      topology_sequences = "oooooMMMMMiiiii"
    )
  )
  expect_true(
    are_topology_sequences(
      topology_sequences = c("oooooMMMMMiiiii", "oooooMMMMMiiiii")
    )
  )
  expect_false(
    are_topology_sequences(
      topology_sequences = c("oooooMMMMMiiiii", "nonsense")
    )
  )
  expect_false(are_topology_sequences(">5H2A_CRIGR"))
  expect_false(are_topology_sequences("5H2A_CRIGR"))
  expect_false(are_topology_sequences(NA))
  expect_false(are_topology_sequences(topology_sequences = NULL))
  expect_false(are_topology_sequences(""))
})
