#' Authentificate via email with Firebase
#'
#' @param auth_email email of the Firebase user
#' @param auth_password password  of the Firebase user
#' @param api_key web api key of the Firebase database
#'
#' @return list with status and body
#' @export
#'
#' @examples
fire_email_auth <- function (auth_email, auth_password, api_key) {
  response <-
    POST(
      glue("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key={api_key}"),
      body = list(
        email = toString(auth_email),
        password = toString(auth_password),
        returnSecureToken = TRUE
      ),
      encode = "json"
    )
  status <- http_status(response)$category
  body <- content(response, "text")
  
  auth_response <- list(response = response, status = status, body = body)
  
  return(auth_response)
}