#' Package Version
#'
#' Get the current version of pipework
#'
#' @keywords internal
#' @noRd
get_pkg_version = function(pkg = "pipework") {
  as.character(utils::packageVersion(pkg))
}
