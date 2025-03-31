#' Check and setup BigQuery authentication
#'
#' `setup_bq_auth()` is a wrapper function around `bigrquery::bq_auth()`. It's
#' main focus is to check the `GCS_AUTH_FILE` environment variable has been
#' set and is available. If available, it will use the string file path that 
#' points to a `json` key for authentication into the service.
#'
#' @returns nothing
#'
#' @export
setup_bq_auth <- function() {
  if(Sys.getenv("GCS_AUTH_FILE") == length(0)) {
    stop("GCS_AUTH_FILE not set in .Renviron")
  } else {
    bigrquery::bq_auth(
      path = Sys.getenv("GCS_AUTH_FILE"),
      use_oob = TRUE
    )
  }
}
