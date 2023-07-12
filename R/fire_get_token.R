#' Get token to read from Firebase database
#'
#' @param auth_email email of the Firebase user
#' @param auth_password password  of the Firebase user
#' @param api_key web api key of the Firebase database
#'
#' @return
#' @export
#'
#' @examples
fire_get_token <- function(auth_email, auth_password, api_key) {
  
  auth <- fire_email_auth(auth_email, auth_password, api_key)
  
  parsed_response <- as.character(auth)
  parsed_data <- fromJSON(auth)
  id_token <- parsed_data$idToken
  
  return(id_token)
  
}