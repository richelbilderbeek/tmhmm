test_that("use", {
  expect_true(is_locatome_line("oooooMMMMMiiiii"))
  expect_false(is_locatome_line(">5H2A_CRIGR"))
  expect_false(is_locatome_line("5H2A_CRIGR"))
  expect_false(is_locatome_line(NA))
  expect_false(is_locatome_line(NULL))
  expect_false(is_locatome_line(""))
})
