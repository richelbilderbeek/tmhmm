% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/are_tmhs.R
\name{are_tmhs}
\alias{are_tmhs}
\title{Are the sequences TMHs?}
\usage{
are_tmhs(protein_sequences)
}
\arguments{
\item{protein_sequences}{one or more protein sequences}
}
\description{
Are the sequences TMHs?
}
\examples{
if (is_tmhmm_installed()) {

  sequences <- c(
    "VVIILTIAGNILVIMAVSLE",
    "VVIILTIRGNILVIMAVSLE"
  )

  are_tmhs(sequences)
}
}
\author{
Richèl J.C. Bilderbeek
}
