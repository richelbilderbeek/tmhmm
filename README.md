# tmhmm

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---
master|[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=master)](https://travis-ci.org/richelbilderbeek/tmhmm)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tmhmm/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/tmhmm/branch/master)
develop|[![Build Status](https://travis-ci.org/richelbilderbeek/tmhmm.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/tmhmm)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tmhmm/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/tmhmm/branch/develop)

R package for [TMHMM](http://www.cbs.dtu.dk/services/TMHMM) [1, 2],
to predict transmembrane helices in proteins.

> Please note that TMHMM is intended for academic users only. 
> Other users are requested
> to contact the TMHMM Software Package Manager at software@cbs.dtu.dk

 * [YouTube video](https://youtu.be/WtP9M1Yk9PA) or [download video](http://richelbilderbeek.nl/tmhmm.ogv)

## Install

```
usethis::install_github("richelbilderbeek/tmhmm")
```

Install TMHMM to a default folder:

```
library(tmhmm)
install_tmhmm("http://www.cbs.dtu.dk/download/D3198788-0F1D-11E9-883C-84B3B9CD16B5/")
```


The URL can be obtained by requesting a download link at 
the [TMHMM](http://www.cbs.dtu.dk/services/TMHMM) website 
at [http://www.cbs.dtu.dk/services/TMHMM](http://www.cbs.dtu.dk/services/TMHMM).
As this URL expires after four hours, `tmhmm` cannot do this for you.

## Usage

We need a FASTA file to work on:

```{r}
fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
```

The FASTA file should contain the protein sequences of one or more
genes. Reading the file ...

```
cat(readLines(fasta_filename), sep = "\n")
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
cat(locatome, sep = "\n")
>5H2A_CRIGR you can have comments after the ID
oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
ooooMMMMMMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooooooo
ooooMMMMMMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiiiiiiiiiMMMMMMMMMMMMMMMMMMMMMMMoo
oooooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooooooMMMM
MMMMMMMMMMMMMMMMMMMiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

The legend of these locations:
Character	Location
i	Inside or cytosol-side
o	Outside or surroundings-side
M	Transmembrane


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
