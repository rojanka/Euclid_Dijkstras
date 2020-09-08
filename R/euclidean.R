#' Get GCD of two numbers
#' 
#' Implements Euclid's algorithm to compute the greatest common divisor of two numbers
#' 
#' @param x A number
#' @param y A number
#' @return Greatest common divisor of \strong{\code{x}} and \strong{\code{y}}.
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)
#' @references \href{https://en.wikipedia.org/wiki/Euclidean_algorithm}{Euclidean Algorithm}
#' @export

euclidean <- function(x, y) {
  while (y!= 0) {
    t <- y
    y <- x %% y
    x <- t
  }
  return(x)
}
