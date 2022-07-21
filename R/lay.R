#' Add package code for API generation
#'
#' This is the core function of the pipework package.
#' Initiate a pipework project in an existing package. If
#' not currently a package see \code{usethis::use_package()}.
#' This will add the necessary utilities to generate a plumber
#' object from a collection of routes in inst/extdata/api/routes.
#'
#' @export
lay_pipework = function() {
  check_package()
  if (is_pipework()) {
    stop("This looks to already be a pipework project", call. = FALSE)
  }
  cli::cli_h1("Laying pipe")
  cli::cli_h2("Creating lock file")
  create_lock_file()

  cli::cli_h2("Generating code")
  create_from_template("R", "_generate_api.R")

  cli::cli_h3("Adding dependencies for generated code")
  add_imports(c(
    "utils", "stringr", "plumber",
    "purrr"
  ))

  cli::cli_h2("Creating location for route definitions")
  create_routes_dir()
}
