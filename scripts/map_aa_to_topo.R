tmhmm_filename <- "UP000005640.tmhmm"
fasta_filename <- "UP000005640.fasta"

testthat::expect_true(file.exists(tmhmm_filename))
testthat::expect_true(file.exists(fasta_filename))
t_sequences <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
t_topo <- pureseqtmr::load_fasta_file_as_tibble(tmhmm_filename)

testthat::expect_equal(nrow(t_sequences), nrow(t_topo))
testthat::expect_equal(nchar(t_sequences$sequence), nchar(t_topo$sequence))

Peptides::aaList()
imoIMO