test_that("use", {
  if (!is_tmhmm_installed()) return()

  protein_sequence <- "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP" # nolint indeed long
  locatome <- run_tmhmm_on_sequence(protein_sequence)
  expect_equal(
    locatome,
    "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiii" # nolint indeed long
  )
})

test_that("Give proper error when a ? is in the protein sequence", {
  if (!is_tmhmm_installed()) return()
  skip("Issue #2")
  # Escalated from https://github.com/richelbilderbeek/bbbq_article/issues/74
  protein_sequence <- "IMPRESSIVELYFLI?AWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY" # nolint indeed long
  expect_error(
    run_tmhmm_on_sequence(protein_sequence),
    "Character '?' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'."
  )

})
