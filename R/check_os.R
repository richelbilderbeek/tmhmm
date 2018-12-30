#' Checks if the operating system is supported
#' @inheritParams default_params_doc
#' @return nothing. Will stop if the OS is unsupported
#' @author Richel J.C. Bilderbeek
check_os <- function(os) {
  if (os == "mac") {
    stop("MacOSX is not supported, but may be in the future")
  }
  if (os == "win") {
    stop("Windows is not supported, but may be in the future")
  }
  if (os != "unix") {
    stop("'os' must be 'unix'")
  }
}
