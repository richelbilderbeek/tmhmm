context("test-check_os")

test_that("use", {
  expect_silent(check_os("unix"))
  expect_error(
    check_os("mac"),
    "MacOSX is not supported, but may be in the future"
  )
  expect_error(
    check_os("win"),
    "Windows is not supported, but may be in the future"
  )
  expect_error(
    check_os("nonsense"),
    "'os' must be 'unix'"
  )
})
