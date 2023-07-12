#' Read data from a Firebase database node in json format
#'
#' @param auth_email email of the Firebase user
#' @param auth_password password  of the Firebase user
#' @param api_key web api key of the Firebase database
#' @param database_url url of a Firebase database
#' @param node path to the Firebase database node
#'
#' @return parsed json into a dataframe
#' @export
#'
#' @examples
fire_read_data <- function(auth_email,
                           auth_password,
                           api_key,
                           database_url,
                           node) {
  
  token <- get_token(auth_email, auth_password, api_key)
  
  command <- glue("curl '{database_url}/{node}.json?auth={token}'")
  
  fire_data <- system(command, intern = TRUE)
  
  parsed_fire_data <- fire_data |>
    fromJSON()
  
  return(parsed_fire_data)
  
}
