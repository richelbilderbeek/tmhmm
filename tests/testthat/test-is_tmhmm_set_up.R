
test_that("use", {
  if (!is_tmhmm_installed()) return()

  expect_true(is_tmhmm_set_up())

  if (!is_on_ci()) return()

  # Start from empty folder
  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  testthat::expect_true(!dir.exists(folder_name))

  # No files, thus not set up, and cannot setup
  expect_false(is_tmhmm_set_up(folder_name = folder_name))
  expect_error(
    set_up_tmhmm(folder_name = folder_name),
    "TMHMM binary file absent at path "
  )

  # Only install binary, thus not set up
  install_tmhmm_bin(folder_name = folder_name)
  expect_false(is_tmhmm_set_up(folder_name = folder_name))

  # Set up
  set_up_tmhmm(folder_name = folder_name)
  expect_true(is_tmhmm_set_up(folder_name = folder_name))

  # Break first line
  bin_filename <- file.path(folder_name, "tmhmm-2.0c", "bin", "tmhmm")
  lines <- readLines(bin_filename)
  lines[1] <- "#!/usr/local/bin/perl"
  writeLines(lines, bin_filename)
  expect_false(is_tmhmm_set_up(folder_name = folder_name))

  # Fix first line
  lines[1] <- "#!/usr/bin/perl"
  writeLines(lines, bin_filename)
  expect_true(is_tmhmm_set_up(folder_name = folder_name))

  ##############################################################################
  # Options file
  ##############################################################################
  options_filename <- file.path(
    folder_name, "tmhmm-2.0c", "lib", "TMHMM2.0.options"
  )
  testthat::expect_true(file.exists(options_filename))
  good_lines <- readLines(options_filename)
  lines <- good_lines

  # Break PrintNumbers comment
  lines[which(lines == "#PrintNumbers #for tmhmm")] <- "PrintNumbers" # nolint this is no commented code
  writeLines(lines, options_filename)
  expect_false(is_tmhmm_set_up(folder_name = folder_name))
  writeLines(good_lines, options_filename)
  expect_true(is_tmhmm_set_up(folder_name = folder_name))

  # Break PrintScore comment
  lines[which(lines == "#PrintScore #for tmhmm")] <- "PrintScore" # nolint this is no commented code
  writeLines(lines, options_filename)
  expect_false(is_tmhmm_set_up(folder_name = folder_name))
  writeLines(good_lines, options_filename)
  expect_true(is_tmhmm_set_up(folder_name = folder_name))

  # Break PrintStat comment
  lines[which(lines == "#PrintStat #for tmhmm")] <- "PrintStat" # nolint this is no commented code
  writeLines(lines, options_filename)
  expect_false(is_tmhmm_set_up(folder_name = folder_name))
  writeLines(good_lines, options_filename)
  expect_true(is_tmhmm_set_up(folder_name = folder_name))

  # Break PrintSeq comment
  lines[which(lines == "#PrintSeq #for tmhmm")] <- "PrintSeq" # nolint this is no commented code
  writeLines(lines, options_filename)
  expect_false(is_tmhmm_set_up(folder_name = folder_name))
  writeLines(good_lines, options_filename)
  expect_true(is_tmhmm_set_up(folder_name = folder_name))
})
