create_from_template = function(..., target_name) {
  check_pipework()
  in_file = template_file(...)
  if (missing(target_name)) {
    target_name = basename(in_file)
  }
  out_file = file.path("R", target_name)
  fs::file_copy(in_file, out_file)
  cli::cli_alert_success("Created file {.file {out_file}}")
}

create_routes_dir = function() {
  check_pipework()
  target_dir = "inst/extdata/api/routes"
  created = dir.create(target_dir, recursive = TRUE)
  if (created) {
    cli::cli_alert_success("Create directory {.file {target_dir}}")
  }
  invisible(created)
}
