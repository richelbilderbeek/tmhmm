test_that("uninstall absent TMHMM must throw", {
  skip("Cannot test with expiring download link")

  expect_error(
    uninstall_tmhmm(folder_name = "absent"),
    "Cannot uninstall absent TMHMM at"
  )
})
