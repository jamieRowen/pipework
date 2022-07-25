.route_template = "
#* @{method} /{name}
api_{name}
"

.api_wrapper_template = "
#' {name}
#' 
#' @export
api_{name} = function() {{
  # this wrapper allows us to do some processing
  # of the inputs/outputs to wrap our core logic function
  # as appropriate for the api
}}
"

.func_template = "
#' {name}
{name} = function() {{
  
}}
"


route_error = function() {
  stop("Route appears to have no path parts", call. = FALSE)
}

base_route = function(route_parts, method) {
  check_pipework()
  cli::cli_h1(
    paste0("Creating route @", method, " /", route_parts)
  )
  endpoint_name = route_parts
  write_inst_route_file("_", method, endpoint_name)
  write_api_file("_", endpoint_name)
  write_r_src(endpoint_name)
}

file_route = function(route_parts, method) {
  check_pipework()
  cli::cli_h1(
    paste0(
      "Creating route @", method, " /",
      paste0(route_parts, collapse = "/")
    )
  )
  endpoint_name = route_parts[2]
  write_inst_route_file(route_parts[1], method, endpoint_name)
  write_api_file(route_parts[1], endpoint_name)
  write_r_src(endpoint_name)
}

nested_file_route = function(route_parts, method) {
  check_pipework()
  cli::cli_h1(
    paste0(
      "Creating route @", method, " /",
      paste0(route_parts, collapse = "/")
    )
  )
  endpoint_name = route_parts[length(route_parts)]
  fpath = do.call(file.path, as.list(route_parts[-length(route_parts)]))
  write_inst_route_file(fpath, method, endpoint_name)
  write_api_file(
    paste0(route_parts[-length(route_parts)], collapse = "_"),
    endpoint_name
  )
  write_r_src(endpoint_name)
}

ensure_directory = function(file_path) {
  dirname = dirname(file_path)
  exists = dir.exists(dirname)
  if (!exists) {
    cli::cli_alert_info(paste0("Creating directory ", dirname))
    dir.create(dirname, recursive = TRUE)
  }
}

write_file = function(str, filename) {
  file_exists = has(filename)
  if (file_exists) {
    msg = paste0("Appending to ", filename)
    append = TRUE
  } else {
    msg = paste0("Creating file ", filename)
    append = FALSE
  }
  cli::cli_alert_info(msg)
  cli::cli_alert_info(paste0("Adding\n\"\n", str, "\n\""))
  write(str, file = filename, append = append)
}

write_inst_route_file = function(file_path, method, route_name) {
  filename = file.path("inst", "extdata", "api", "routes", paste0(file_path, ".R"))
  ensure_directory(filename)
  str = glue::glue_data(list(method = method, name = route_name), .route_template)
  write_file(str, filename)
}

write_api_file = function(file_path, route_name) {
  if (file_path == "_") {
    file_path = ""
  }
  filename = file.path("R", paste0("api_", file_path, ".R"))
  str = glue::glue_data(list(name = route_name), .api_wrapper_template)
  write_file(str, filename)
}

write_r_src = function(route_name) {
  filename = file.path("R", paste0(route_name, ".R"))
  str = glue::glue_data(list(name = route_name), .func_template)
  write_file(str, filename)
}
