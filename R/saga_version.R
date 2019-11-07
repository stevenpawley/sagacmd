#' Return the installed version of SAGA-GIS
#'
#' Intended to be used internally by \code{\link{saga_env}}. Uses a system call
#' to saga_cmd to output version of installed SAGA-GIS on the console
#'
#' @param saga_cmd character, path of the saga_cmd binary
#'
#' @return numeric_version, version of SAGA-GIS found at the cmd path
saga_version <- function(saga_cmd) {
  
  saga_vers <- system(paste(shQuote(saga_cmd), "--version"), intern = T)[1]
  saga_vers <- regmatches(saga_vers, regexpr("\\d.\\d.\\d", saga_vers))
  saga_vers <- trimws(saga_vers)
  
  as.numeric_version(saga_vers)
}