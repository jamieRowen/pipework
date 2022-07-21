#' Add package code for logging
#'
#' Creates a file in R/ of your package that
#' provides functions for setting up and using a logger
#' with your API.
#'
#' @export
add_logging = function() {
  check_pipework()
  cli::cli_h1("Adding logging tools")
  cli::cli_h2("Generating code")
  create_from_template("R", "_logger.R")

  cli::cli_h3("Adding dependencies for generated code")
  add_imports(c(
    "jsonlite", "logger", "rlang", "stringr"
  ))
  cli::cli_alert_success("logging can be set up with `setup_logger()`")
}
