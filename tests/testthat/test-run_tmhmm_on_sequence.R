test_that("use", {
  protein_sequence <- "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP" # nolint indeed long
  locatome <- run_tmhmm_on_sequence(protein_sequence)
  expect_equal(
    locatome,
    "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiii" # nolint indeed long
  )
})
