# Prepare the data
if (1 == 2) {
  tmhmm_filename <- "UP000005640.tmhmm"
  fasta_filename <- "UP000005640.fasta"

  testthat::expect_true(file.exists(tmhmm_filename))
  testthat::expect_true(file.exists(fasta_filename))
  t_sequences <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  t_topo <- pureseqtmr::load_fasta_file_as_tibble(tmhmm_filename)

  testthat::expect_equal(nrow(t_sequences), nrow(t_topo))
  testthat::expect_equal(nchar(t_sequences$sequence), nchar(t_topo$sequence))
}

counts_filename <- "counts.csv"
testthat::expect_true(file.exists(counts_filename))
readr::rea
t <- readr::read_csv(counts_filename)

topo <- t$topo
t$topo <- NULL

t[1, ] <- t[1, ] / sum(t[1, ])
t[2, ] <- 0.0
t[3, ] <- t[3, ] / sum(t[3, ])
t[4, ] <- 0.0
t[5, ] <- t[5, ] / sum(t[5, ])
t[6, ] <- t[6, ] / sum(t[6, ])

for (i in seq_len(26)) {
  col <- t[ ,i]
  topo_str <- topo[which(t[ ,i] == max(t[ ,i]))]
  print(paste0(LETTERS[i], " -> ", topo_str))
}
