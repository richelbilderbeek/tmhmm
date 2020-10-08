test_that("use", {
  if (!is_tmhmm_installed()) return()

  protein_sequence <- "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP" # nolint indeed long
  locatome <- run_tmhmm_on_sequence(protein_sequence)
  expect_equal(
    locatome,
    "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiii" # nolint indeed long
  )
})

test_that("long sequence", {
  if (!is_tmhmm_installed()) return()

  skip("Issue #3")
  # https://github.com/richelbilderbeek/tmhmm/issues/3
  protein_sequence <- paste0(rep("FAMILYVW", 20), collapse = "")
  topology <- run_tmhmm_on_sequence(protein_sequence)
  expect_equal(
    stringr::str_length(protein_sequence),
    stringr::str_length(topology)
  )
})

test_that("Give proper error when a ? is in the protein sequence", {
  if (!is_tmhmm_installed()) return()

  protein_sequence <- "IMPRESSIVELYFLI?AWAYFANSWALKSWEETMARKETTRIVIALLYNAILIDENTIFY" # nolint indeed long
  expect_error(
    run_tmhmm_on_sequence(protein_sequence),
    "Character '\\?' not allowed in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'."
  )
})
