% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_intervention.R
\name{get_intervention}
\alias{get_intervention}
\title{Get intervention data}
\usage{
get_intervention(intervention = c("itn", "irs"), year = c(2020, 2015))
}
\arguments{
\item{intervention}{\code{character} which interventions do you want? all, irs, or
itn?}
}
\value{
\code{SpatRaster}
}
\description{
Returns ITN and or IRS data from MAP.
}
\examples{
\dontrun{
get_intervention("itn")
}
}