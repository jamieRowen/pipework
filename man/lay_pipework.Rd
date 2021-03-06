% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lay.R
\name{lay_pipework}
\alias{lay_pipework}
\title{Add package code for API generation}
\usage{
lay_pipework()
}
\description{
This is the core function of the pipework package.
Initiate a pipework project in an existing package. If
not currently a package see \code{usethis::use_package()}.
This will add the necessary utilities to generate a plumber
object from a collection of routes in inst/extdata/api/routes.
}
