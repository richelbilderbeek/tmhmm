test_that("use", {
  expect_error(check_topology("nonsense"))
  expect_error(check_topology(""))
  expect_error(check_topology(NA))
  expect_error(check_topology(NULL))
  expect_error(check_topology(Inf))
  expect_error(check_topology(3.14))
  expect_error(
    check_topology(
      topology = tibble::tibble()
    )
  )
  expect_error(
    check_topology(
      topology = tibble::tibble(name = "X", nonsense = "Y")
    )
  )

})

test_that("use", {
  if (!is_tmhmm_installed()) return()
  fasta_filename <- system.file(
    "extdata", "example_2.fasta", package = "tmhmm"
  )
  expect_silent(check_topology(predict_topology(fasta_filename)))
})
