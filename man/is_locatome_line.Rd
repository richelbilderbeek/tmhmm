% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_locatome_line.R
\name{is_locatome_line}
\alias{is_locatome_line}
\title{Is the topology sequence valid?}
\usage{
is_locatome_line(line)
}
\arguments{
\item{line}{a topology sequence}
}
\description{
Is the topology sequence valid?
}
\examples{
# A valid topology sequence
is_locatome_line("oooooMMMMMiiiii")

# An invalid topology sequence
is_locatome_line("nonsense")
}
