#' r2dii packages
#'
#' @return A string giving the name of all r2dii packages
#' @export
#'
#' @examples
#' r2dii_pkgs()
r2dii_pkgs <- function() {
  pkgs <- utils::packageDescription("r2dii", fields = "Depends", drop = T)
  pkgs <- strsplit(pkgs, ",")[[1]]
  vapply(pkgs, function(x) sub("\n", "", x), character(1), USE.NAMES = FALSE)
}
