#' @title Read historical bike trips data in Norway to R
#'
#' @description
#' \code{read_trips_data} imports anonymized historical bike trips data in
#' Norway for the city of Oslo, Bergen, and Trondheim directly to R.
#'
#' The data is provided according to the Norwegian License for Open Government
#' Data 2.0 \href{https://data.norge.no/nlod/en/2.0}{NLOD 2.0}.
#'
#' The data is read from:
#'
#' \itemize{
#'   \item \href{https://oslobysykkel.no/en/open-data/historical}{Oslo City Bike}
#'   \item \href{https://bergenbysykkel.no/en/open-data/historical}{Bergen City Bike}
#'   \item \href{https://trondheimbysykkel.no/en/open-data/historical}{Trondheim City Bike}
#'}
#'
#' @usage
#' read_trips_data(year, month, city)
#'
#' @param year
#' A number. The year that you want to download data for.
#'
#' @param month
#' A number. The month that you want to download data for.
#'
#' @param city
#' A string. The city you want to download data from. The options are
#' "Oslo", "Bergen", and "Trondheim".
#'
#' @return
#' The function reads in bike trips data for the specified year, month, and city
#' to R as a tibble.
#'
#' @examples
#' \dontrun{
#'
#' # Read bike trips data for the month of January 2019 in Bergen
#' bergen_trips <- read_trips_data(2019, 1, "Bergen")
#'
#' # Read bike trips data for the month of October 2018 in Trondheim
#' trondheim_trips <- read_trips_data(2018, 10, "Trondheim")
#'
#' }
#'
#' @importFrom glue glue
#' @importFrom tibble as_tibble
#' @importFrom httr http_error
#' @importFrom lubridate month
#' @importFrom lubridate year
#' @export read_trips_data

read_trips_data <- function(year, month, city) {

  # Control input arguments -------------------------------------------------

  bysykkel_control_input(year, month, city)

  bysykkel_control_date(year, month, city)

  message(glue::glue("Getting bike data for {city} for ",
                     "{lubridate::month(month, label = TRUE, abbr = FALSE)}, ",
                     "{year}."))

  # Control structure -------------------------------------------------------

  switch(city,
         "Oslo" = read_trips_data_oslo(year, month),
         "Bergen" = read_trips_data_bergen(year, month),
         "Trondheim" = read_trips_data_trondheim(year, month),
         stop(paste0("\"", city, "\" is an invalid city name."))
  )

}
