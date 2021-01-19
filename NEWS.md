# News

Newest versions at top.

## tmhmm 1.4 (unreleased)

### NEW FEATURES

  * Added `predict_topology_from_sequence` 
    and `predict_topologies_from_sequences` to directly predict topologies
    from protein sequences
  * Added dependency on `pureseqtmr`, 
    for `pureseqtmr::load_fasta_file_as_tibble`,
    which is approximately ten thousand times faster than `parse_fasta_file`
  * Added `mock_run_tmhmm` to mock `run_tmhmm`, which is useful in debugging
 
### MINOR IMPROVEMENTS

  * None

### BUG FIXES

  * Allow the prediction of the complete topology for bigger FASTA files, 
    fix [#4](https://github.com/richelbilderbeek/tmhmm/issues/4)

### DEPRECATED AND DEFUNCT

  * `locatome_to_df` is deprecated, use `fasta_text_to_tibble` instead
  * `is_tmhmm_result` is deprecated, use `is_topology_text` instead
  * `is_locatome_line` is deprecated, use `is_topology_sequence` instead
  * `parse_fasta_file` is deprecated, use `pureseqtmr::load_fasta_file_as_tibble` instead
  * Replace the argument name `locatome` by the more descriptive `topology_text`

## tmhmm 1.3 (2020-10-08)

### NEW FEATURES

  * Add `tally_tmhs`
  * Add `CONTRIBUTING.md`
  * Add Code Of Conduct
 
### MINOR IMPROVEMENTS

  * `locatome_to_df` returns a table with a column named 'topology',
    instead of the less clear 'locatome'

### BUG FIXES

  * `run_tmhmm_on_sequence` returns a topology with the same length
    as the protein sequence ([#3](https://github.com/richelbilderbeek/tmhmm/issues/3))

### DEPRECATED AND DEFUNCT

  * None

## tmhmm 1.2 (2020-09-15)

### NEW FEATURES

  * Add `NEWS.md`
  
### MINOR IMPROVEMENTS

  * Give proper error when having a question mark in the protein sequence ([#2](https://github.com/richelbilderbeek/tmhmm/issues/2))

### BUG FIXES

  * None

### DEPRECATED AND DEFUNCT

  * None

