% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/install_tmhmm.R
\name{install_tmhmm}
\alias{install_tmhmm}
\title{Install NetMHC2pan to a local folder}
\usage{
install_tmhmm(
  download_url = get_tmhmm_url(),
  folder_name = get_default_tmhmm_folder()
)
}
\arguments{
\item{download_url}{the URL to download TMHMM from}

\item{folder_name}{superfolder of TMHMM.
The superfolder's name is \code{/home/[user_name]/.local/share}
by default, as can be obtained by
\link{get_default_tmhmm_folder}}
}
\description{
Install NetMHC2pan to a local folder
}
\examples{
\donttest{
  if (is_url_valid() && !is_tmhmm_installed()) {
    install_tmhmm()
  }
}
}
\author{
Richèl J.C. Bilderbeek
}
