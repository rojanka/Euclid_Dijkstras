#' Internodal distances in a graph
#'
#' A dataset pertaining to the graph on Wikipedia's Dijkstra's algorithm page (as on Tue 8 Sep 2020)
#' 
#' @description Each row in the dataset pertains to a pair of adjacent nodes in a particular graph (see Details).
#' Each such pair consists of a "starting node" and the "adjacent node". The distance between each
#' such pair is be specified by the dataset.
#'  
#' @format A data frame with 18 rows and 3 variables:
#' \describe{ 
#' 
#'   \item{v1}{names of starting nodes}
#'   \item{v2}{names of corresponding adjacent nodes}
#'   \item{w}{the distances between pairs of starting and adjacent nodes}
#' }
#' 
#' @source \url{https://en.wikipedia.org/wiki/Dijkstra\%27s_algorithm}
"wiki_graph"