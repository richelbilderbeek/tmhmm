test_that("use", {
  expect_true(is_protein_name_line(">5H2A_CRIGR"))
  expect_false(is_protein_name_line("5H2A_CRIGR"))
  expect_false(is_protein_name_line("oooooMMMMMiiiii"))
  expect_false(is_protein_name_line(NA))
  expect_false(is_protein_name_line(NULL))
  expect_false(is_protein_name_line(""))
})
