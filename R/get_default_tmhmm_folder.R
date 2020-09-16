#' Get the path to the folder where this package installs
#' TMHMM by default
#' @return the path to the folder where this package installs
#'   TMHMM by default
#' @examples
#' get_default_tmhmm_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_tmhmm_folder <- function() {
  rappdirs::user_data_dir()
}
