test_that("use", {
  protein_sequence <-
    "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP"
  topology <- mock_predict_topology_from_sequence(
    protein_sequence = protein_sequence
  )
  expect_equal(
    topology,
      "OOOoMOMMMoMMMMMMoMMMoMMMMMMMOMOOOMOoMooMMMMOMMMMoMMMMMMMMOMOMMoMMMMMiMO"
  )
  expect_equal(nchar(protein_sequence), nchar(topology))
})
