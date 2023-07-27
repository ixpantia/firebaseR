#' Delete data from a Firebase database node
#'
#' @param auth_email email of the Firebase user
#' @param auth_password password  of the Firebase user
#' @param api_key web api key of the Firebase database
#' @param database_url url of a Firebase database
#' @param node path to the Firebase database node
#'
#' @return
#' @export
#'
#' @examples
fire_delete_data <- function(auth_email,
                             auth_password,
                             api_key,
                             database_url,
                             node) {
  
  token <- obtiene_token(auth_email, auth_password, api_key)

  command <- glue("curl -X DELETE '{database_url}/{node}.json?auth={token}'")
  
  system(comand)
  
}
