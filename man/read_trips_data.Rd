% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_trips_data.R
\name{read_trips_data}
\alias{read_trips_data}
\title{Read historical bike trips data in Norway to R}
\usage{
read_trips_data(year, month, city)
}
\arguments{
\item{year}{A number. The year that you want to download data for.}

\item{month}{A number. The month that you want to download data for.}

\item{city}{A string. The city you want to download data from. The options are
"Oslo", "Bergen", and "Trondheim".}
}
\value{
The function reads in bike trips data for the specified year, month, and city
to R as a tibble.
}
\description{
\code{read_trips_data} imports anonymized historical bike trips data in
Norway for the city of Oslo, Bergen, and Trondheim directly to R.

The data is provided according to the Norwegian License for Open Government
Data 2.0 \href{https://data.norge.no/nlod/en/2.0}{NLOD 2.0}.

The data is read from:

\itemize{
  \item \href{https://oslobysykkel.no/en/open-data/historical}{Oslo City Bike}
  \item \href{https://bergenbysykkel.no/en/open-data/historical}{Bergen City Bike}
  \item \href{https://trondheimbysykkel.no/en/open-data/historical}{Trondheim City Bike}
}
}
\examples{
\dontrun{

# Read bike trips data for the month of January 2019 in Bergen
bergen_trips <- read_trips_data(2019, 1, "Bergen")

# Read bike trips data for the month of October 2018 in Trondheim
trondheim_trips <- read_trips_data(2018, 10, "Trondheim")

}

}
