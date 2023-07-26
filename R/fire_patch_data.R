#' Patch data in json format to a Firebase database
#'
#' @param data data to send to Firebase in json format
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
fire_patch_data <- function(data,
                            auth_email,
                            auth_password,
                            api_key,
                            database_url,
                            node) {
  
  token <- get_token(auth_email, auth_password, api_key)
  
  command <- glue("curl -X PATCH -d {data} '{database_url}/{node}.json?auth={token}'")
  
  system(command)
  
}