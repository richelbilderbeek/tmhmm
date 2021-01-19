#' Mock the topology prediction.
#'
#' Use \link{predict_topology_from_sequence} for a real prediction.
#' @inheritParams default_params_doc
#' @return a topology sequence,
#'   for example \code{"iiiimmmmmoooo"}
#' @examples
#' protein_sequence <- paste0(
#'   "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'   "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#' )
#' mock_predict_topology_from_sequence(protein_sequence)
#' @author Richèl J.C. Bilderbeek
#' @export
mock_predict_topology_from_sequence <- function(protein_sequence) { # nolint indeed a long function name

  there <- stringr::str_locate(
    string = protein_sequence,
    pattern = "[^ACDEFGHIKLMNPQRSTVWYBXZ]"
  )
  if (!is.na(there[1][1])) {
    invalid_char <- stringr::str_sub(
      protein_sequence,
      start = there[1, 1],
      end = there[1, 1]
    )
    stop(
      "Character '", invalid_char, "' not allowed ",
      "in alphabet 'ACDEFGHIKLMNPQRSTVWYBXZ'"
    )
  }

  s <- stringr::str_replace_all(
    string = protein_sequence,
    pattern = "(B|J|O|U|X|Z)",
    replacement = "."
  )
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(A|C|F|G|I|L|M|V|W|Y)",
    replacement = "M"
  )
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(P|E|K|Q|S)",
    replacement = "O"
  )
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(H|R)",
    replacement = "i"
  )
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(D|N|T)",
    replacement = "o"
  )
  s
}
