% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Term_to_numeric_value.R
\name{Term_name}
\alias{Term_name}
\title{Term name}
\usage{
Term_name(TERM_ID)
}
\arguments{
\item{TERM_ID}{A term character or factor code with values such as  "2019FL" or "2010SU"}
}
\description{
Converts semester term codes to their English equivalent.  Based on \verb{Convert STCTERM to numeric value.sps}.
}
\examples{
Term("2019FL")  #Fall
Term("2010SU")  #Summer
Term("2011SP")  #Spring
Term("2011S")  #2011S - Doesn't match the pattern
}
