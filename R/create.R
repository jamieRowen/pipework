create_from_template = function(..., target_name) {
  in_file = template_file(...)
  if (missing(target_name)) {
    target_name = basename(in_file)
  }
  out_file = file.path("R", target_name)
  fs::file_copy(in_file, out_file)
  cli::cli_alert_success("Created file {.file {out_file}}")
}