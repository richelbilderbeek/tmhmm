test_that("use", {
  df <- tally_locatome("iMMooo")
  expect_equal(1, df[df$location == "i", ]$count)
  expect_equal(2, df[df$location == "M", ]$count)
  expect_equal(3, df[df$location == "o", ]$count)
})

test_that("use on TMH", {
  if (!is_tmhmm_installed()) return()

  locatome <- run_tmhmm_on_sequence(
    "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQ"
  )
  expect_equal(locatome, "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooo")
  df <- tally_locatome(locatome)
  expect_equal(6, df[df$location == "i", ]$count)
  expect_equal(23, df[df$location == "M", ]$count)
  expect_equal(6, df[df$location == "o", ]$count)
})
