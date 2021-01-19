test_that("use", {
  if (!is_tmhmm_installed()) return()
  protein_sequence <-
    "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP"
  topology <- predict_topology_from_sequence(
    protein_sequence = protein_sequence
  )
  expect_equal(
    topology,
      "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiii"
  )
  expect_equal(nchar(protein_sequence), nchar(topology))
})

test_that("use", {
  if (!is_tmhmm_installed()) return()
  expect_error(
    predict_topology_from_sequence(protein_sequence = "U"),
    "Character 'U' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
  )
})
