% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_topology.R
\name{predict_topology}
\alias{predict_topology}
\title{Predict the topology of a membrane protein}
\usage{
predict_topology(
  fasta_filename,
  folder_name = get_default_tmhmm_folder(),
  temp_topology_filename = tempfile(fileext = ".top")
)
}
\arguments{
\item{fasta_filename}{path to a FASTA file}

\item{folder_name}{superfolder of TMHMM.
The superfolder's name is \code{/home/[user_name]/.local/share}
by default, as can be obtained by
\link{get_default_tmhmm_folder}}

\item{temp_topology_filename}{filename to temporarily
save the topology. This file will be deleted when this
function completed successfully}
}
\value{
a \link[tibble]{tibble} with the columns 'name'
  and 'topology', where the 'name' column hold all the proteins' names,
  and 'topology' contains all respective topologies.
}
\description{
Predict the topology of a membrane protein
}
\examples{
if (is_tmhmm_installed()) {
  fasta_filename <- system.file("extdata", "tmhmm.fasta", package = "tmhmm")
  predict_topology(fasta_filename)
}
}
\author{
Richèl J.C. Bilderbeek
}
