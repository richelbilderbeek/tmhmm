# tmhmm

Branch   |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---------|----------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=master)](https://travis-ci.org/richelbilderbeek/tmhmm)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tmhmm/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/tmhmm/branch/master)
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/tmhmm)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tmhmm/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/tmhmm/branch/develop)

R package for [TMHMM](https://services.healthtech.dtu.dk/service.php?TMHMM-2.0) [1, 2],
to predict transmembrane helices in proteins.

> Please note that this page is intended for academic users only. Other users are requested
> to contact the Software Package Manager at health-software@dtu.dk

 * [YouTube video](https://youtu.be/WtP9M1Yk9PA) or [download video](http://richelbilderbeek.nl/tmhmm.ogv)

## Install

```
usethis::install_github("richelbilderbeek/tmhmm")
```

Install TMHMM to a default folder:

```
library(tmhmm)
install_tmhmm("https://services.healthtech.dtu.dk/download/28c408dc-ef5e-47ad-a284-66754bcd27f7")
```


The URL can be obtained by requesting a download link at 
the [TMHMM](https://services.healthtech.dtu.dk/service.php?TMHMM-2.0) website 
at [https://services.healthtech.dtu.dk/service.php?TMHMM-2.0](https://services.healthtech.dtu.dk/service.php?TMHMM-2.0).
As this URL expires after four hours, `tmhmm` cannot do this for you.

## Usage

We need a FASTA file to work on:

```{r}
fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
```

The FASTA file should contain the protein sequences of one or more
genes. Reading the file ...

```
message(readLines(fasta_filename), sep = "\n")
```

results in:

```
>5H2A_CRIGR you can have comments after the ID
MEILCEDNTSLSSIPNSLMQVDGDSGLYRNDFNSRDANSSDASNWTIDGENRTNLSFEGYLPPTCLSILHL
QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP
LPSKLCAVWIYLDVLFSTASIMHLCAISLDRYVAIQNPIHHSRFNSRTKAFLKIIAVWTISVGVSMPIPVF
GLQDDSKVFKQGSCLLADDNFVLIGSFVAFFIPLTIMVITYFLTIKSLQKEATLCVSDLSTRAKLASFSFL
PQSSLSSEKLFQRSIHREPGSYTGRRTMQSISNEQKACKVLGIVFFLFVVMWCPFFITNIMAVICKESCNE
HVIGALLNVFVWIGYLSSAVNPLVYTLFNKTYRSAFSRYIQCQYKENRKPLQLILVNTIPALAYKSSQLQA
GQNKDSKEDAEPTDNDCSMVTLGKQQSEETCTDNINTVNEKVSCV
```

Use `run_tmhmm` to estimate the location of the amino acids 
using TMHMM:

```{r}
locatome <- run_tmhmm(fasta_filename)
```

TMHMM will return a 'locatome': the location
of each amino acid:

 * `i`: inside
 * `o`: outside
 * `M`: membrane

Here is how it looks like:

```
message(locatome, sep = "\n")
>5H2A_CRIGR you can have comments after the ID
oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
ooooMMMMMMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooooooo
ooooMMMMMMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiiiiiiiiiMMMMMMMMMMMMMMMMMMMMMMMoo
oooooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooooooMMMM
MMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
```

## Example

:warning: under construction :warning:

```r
library(tmhmm)

# Use an example proteome
fasta_filename <- system.file(
  "extdata", 
  "UP000464024.fasta", 
  package = "tmhmm"
)

# Predict the topology
topology <- predict_topology(fasta_filename)

# Simplify the protein names
topology$name <- stringr::str_match(
  string = topology$name,
  pattern = "..\\|.*\\|(.*)_SARS2"
)[,2]

# Plot the topology
plot_topology(topology)
```

![SARS-CoV-2 topology](man/figures/sars_cov_2_topology.png)

## FAQ

### Under which operating systems does `tmhmm` work?

`tmhmm` can only work on the set of operating systems TMHMM
works on. Currently, only Linux is supported:

Operating system|Supported by TMHMM|Supported by `tmhmm`
---|---|---
AIX|Y|N
IRIX32|Y|N
IRIX64|Y|N
Linux|Y|Y
MacOS|N|N
OSF1|Y|N
SunOS|Y|N
Windows|N|N

## References

 * [1] A. Krogh, B. Larsson, G. von Heijne, and E. L. L. Sonnhammer.
   Predicting transmembrane protein topology with a hidden Markov model: 
   Application to complete genomes.
   Journal of Molecular Biology, 305(3):567-580, January 2001.

 * [2] E. L.L. Sonnhammer, G. von Heijne, and A. Krogh.
   A hidden Markov model for predicting transmembrane helices 
   in protein sequences.
   In J. Glasgow, T. Littlejohn, F. Major, R. Lathrop, D. Sankoff, 
   and C. Sensen, editors, 
   Proceedings of the Sixth International Conference 
   on Intelligent Systems for Molecular Biology, 
   pages 175-182, Menlo Park, CA, 1998. AAAI Press.
