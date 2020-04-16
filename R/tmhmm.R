#' tmhmm: estimate the topoplogy of membrane proteins
#'
#' Each amino acid that is part a membrane protein can be
#' located either in the cytosol, membrane or at the exterior.
#' 'tmhmm' estimate this topology
#'
#' @examples
#' library(testthat)
#'
#' expect_true(is_tmhmm_installed())
#' fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
#' locatome <- run_tmhmm(fasta_filename)
#' cat(locatome, sep = "\n")
#' @docType package
#' @name tmhmm
NULL
