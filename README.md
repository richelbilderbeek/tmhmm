# tmhmm

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---
master|[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=master)](https://travis-ci.org/richelbilderbeek/tmhmm)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tmhmm/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/tmhmm/branch/master)
develop|[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/tmhmm)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tmhmm/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/tmhmm/branch/develop)

R package for [TMHMM](http://www.cbs.dtu.dk/services/TMHMM/) [1].

## Supported operating systems

 * Linux

## Install

```
usethis::install_github("richelbilderbeek/tmhmm")
```

Install TMHMM to a default folder:

```
library(tmhmm)
install_tmhmm()
```

## Usage

We need a FASTA file:

```
fasta_file <- system.file("extdata", "example.fas", package = "tmhmm")
```

Calling `tmhmm_run` will do the NetMHC2pan analysis:

```
df <- tmhmm_run(fasta_file)
```

The data frame `df` contains the results.

## Notes to self

```
cat example.fasta  | /home/richel/.local/share/tmhmm-2.0c/bin/decodeanhmm.Linux_x86_64 -f /home/richel/.local/share/tmhmm-2.0c/lib/TMHMM2.0.options -modelfile /home/richel/.local/share/tmhmm-2.0c/lib/TMHMM2.0.model
```