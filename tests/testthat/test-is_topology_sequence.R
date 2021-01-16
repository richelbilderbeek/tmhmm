test_that("use", {
  expect_true(is_topology_sequence(topology_sequence = "oooooMMMMMiiiii"))
  expect_false(is_topology_sequence(">5H2A_CRIGR"))
  expect_false(is_topology_sequence("5H2A_CRIGR"))
  expect_false(is_topology_sequence(NA))
  expect_false(is_topology_sequence(NULL))
  expect_false(is_topology_sequence(""))
})
