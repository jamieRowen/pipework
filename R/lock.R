LOCK_FILE = ".pipework" # nolint

#' Create Pipework lock file
#'
#' Lock file currently only used for determining whether
#' the project has been created as a pipework project.
#'
#' @keywords internal
#' @noRd
create_lock_file = function() {
  conf = list(
    version = get_pkg_version()
  )
  write_lock_file(conf)
  cli::cli_alert_success("Creating {.file {LOCK_FILE}}")
}

write_lock_file = function(config) {
  jsonlite::write_json(
    config, path = LOCK_FILE,
    auto_unbox = TRUE,
    pretty = TRUE
  )
}
