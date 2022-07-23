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
  create_from_template("R", "logger_.R", target_dir = "R")

  cli::cli_h3("Adding dependencies for generated code")
  add_imports(c(
    "jsonlite", "logger", "rlang", "stringr"
  ))
  cli::cli_alert_success("logging can be set up with `setup_logger()`")
}

add_pipe = function() {
  check_package()
  usethis::use_pipe()
}

#' Add API entrypoint to root of project
#'
#' Create a runnable entrypoint at the root of your package.
#'
#' @export
add_entrypoint = function() {
  check_pipework()
  cli::cli_h1("Adding API entrypoint")
  cli::cli_h2("Generating code")
  create_from_template("R", "basic_entry_.R", target_name = "entrypoint.R")
  add_pipe()
}

#' Add default logging hooks to your pipework project
#'
#' Creates a file in your package source R/hooks_.R which
#' contains code to register pre and post route logging hooks
#' to your API.
#'
#' @export
add_hooks = function() {
  check_pipework()
  if (has_hooks()) {
    warning("It looks like this project already has hooks.")
    return()
  }
  if (!has_logging()) {
    cli::cli_alert_info("Standard hooks require logging")
    add_logging()
  }
  cli::cli_h1("Adding hooks")
  cli::cli_h2("Generating code")
  create_from_template("R", "hooks_.R", target_dir = "R")
}
