context("test-uninstall_tmhmm")

test_that("uninstall absent TMHMM must throw", {

  expect_error(
    uninstall_tmhmm(folder_name = "absent"),
    "Cannot uninstall absent TMHMM at"
  )
})
