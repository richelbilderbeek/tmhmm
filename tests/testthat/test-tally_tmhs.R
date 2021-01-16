test_that("one protein with two TMHs", {
  if (!is_tmhmm_installed()) return()

  topology <- predict_topology(
    system.file("extdata", "example.fasta", package = "tmhmm")
  )
  tally <- tally_tmhs(topology)
  expect_true("name" %in% names(tally))
  expect_true("n_tmhs" %in% names(tally))
  expect_equal(nrow(topology), nrow(tally))
  expect_equal(1, nrow(tally))
  expect_equal(1, tally$n_tmhs[1])
})

test_that("one protein with two TMHs, one at the start", {
  if (!is_tmhmm_installed()) return()

  topology <- predict_topology(
    system.file("extdata", "example.fasta", package = "tmhmm")
  )
  topology$topology[1] <- "mmmmmmmmoooooommmm"
  tally <- tally_tmhs(topology)
  expect_true("name" %in% names(tally))
  expect_true("n_tmhs" %in% names(tally))
  expect_equal(nrow(topology), nrow(tally))
  expect_equal(1, nrow(tally))
  expect_equal(2, tally$n_tmhs[1])
})
