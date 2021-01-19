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
  # [1] "B -> i" "B -> m" "B -> o" "B -> I" "B -> M" "B -> O"
  # [1] "J -> i" "J -> m" "J -> o" "J -> I" "J -> M" "J -> O"
  # [1] "O -> i" "O -> m" "O -> o" "O -> I" "O -> M" "O -> O"
  # [1] "U -> i" "U -> m" "U -> o" "U -> I" "U -> M" "U -> O"
  # [1] "X -> i" "X -> m" "X -> o" "X -> I" "X -> M" "X -> O"
  # [1] "Z -> i" "Z -> m" "Z -> o" "Z -> I" "Z -> M" "Z -> O"
  s <- stringr::str_replace_all(
    string = protein_sequence,
    pattern = "(B|J|O|U|X|Z)",
    replacement = "."
  )

  # A -> M
  # C -> M
  # F -> M
  # G -> M
  # I -> M
  # L -> M
  # M -> M
  # V -> M
  # W -> M
  # Y -> M
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(A|C|F|G|I|L|M|V|W|Y)",
    replacement = "M"
  )
  # P -> O
  # E -> O
  # K -> O
  # Q -> O
  # S -> O
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(P|E|K|Q|S)",
    replacement = "O"
  )
  # H -> i
  # R -> i
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(H|R)",
    replacement = "i"
  )
  # D -> o
  # N -> o
  # T -> o
  s <- stringr::str_replace_all(
    string = s,
    pattern = "(D|N|T)",
    replacement = "o"
  )
  s
}