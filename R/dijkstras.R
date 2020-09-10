#' Distance Computation Algorithm
#' 
#' Given a connected graph and starting node, find the shortest distance from the starting node to every other node in the graph using Dijkstra's algorithm
#' 
#' @param graph A dataframe with three numeric columns viz. "v1", "v2", and "w", representing each node, its adjacent node, and the distance between them, respectively
#' @param init_node The starting node
#' @return Shortest distance from \strong{\code{init_node}} to all other nodes in the \strong{\code{graph}}.
#'
#' @examples
#' wiki_graph <- data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
#' dijkstra(wiki_graph,1)
#' dijkstra(wiki_graph,3)
#' 
#' @references \href{https://en.wikipedia.org/wiki/Dijkstra\%27s_algorithm}{Dijkstra's Algorithm}
#' @references \href{https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)}{Wiki page on what a graph is and more}
#' 
#' @export

dijkstra <- function(graph, init_node) {
  
  # check for input integrity
  if (!is.data.frame(graph) || !is.numeric(init_node)) {
    stop("The Graph must be a data frame and Init Node must be an numeric scalar")
  } else if(!all(suppressWarnings(tolower(sort(colnames(graph))) == c("v1","v2", "w")))) {
    stop("Structure the Graph Input to have 3 columns: v1, v2 and w")
  } else if (!all(sapply(colnames(graph), function(x) {is.numeric(graph[, x])}))) {
    stop("Graph Input must be numeric")
  } else if (!(init_node %in% graph$v1)) {
    stop("The Initial Node must be on the graph!")
  }
  
  # initialise variables
  all_nodes <- unique(graph$v1)
  dist <- vector(mode="numeric", length=length(all_nodes))
  names(dist) <- all_nodes
  temp_vertex_set <- all_nodes
  prev <- vector()

  for (node in all_nodes) {
    dist[node] <- Inf
    prev[node] <- "UNDEFINED"
  }
  
  dist[init_node] <- 0

  # search for shortest path
  while(length(temp_vertex_set) > 0) {
    dist_temp_vertex_set <- dist[temp_vertex_set]
    u <- names(dist_temp_vertex_set[dist_temp_vertex_set==min(dist_temp_vertex_set)][1]) # set 'u' to vertex amongst temp_vertex_set with the least distance
    temp_vertex_set <- temp_vertex_set[temp_vertex_set != u] # remove 'u' from temp_vertex_set

    for (v in graph[graph$v1 == u, 2]) { # graph[graph$v1 == u, 2] is the set of all neighbours of node 'u'
      alt <- dist[u] + graph[graph$v1 == u & graph$v2 == v, 3]
      if (alt < dist[v]) {
        dist[v] <- alt
        prev[v] <- u
      }
    }
  }

  return(unname(dist))
  
}