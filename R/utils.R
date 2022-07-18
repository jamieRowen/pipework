is_pipework = function() {
  fs::file_exists(LOCK_FILE)
}

check_pipework = function() {
  is = is_pipework()
  if (is) {
    return(invisible(TRUE))
  }
  stop(
    "This is not a pipework project, see `lay_pipework()`",
    call. = FALSE
  )
}

build_ignore_pipework = function() {
  check_pipework()
  usethis::use_build_ignore(LOCK_FILE)
}

template_file = function(...) {
  system.file("template", ..., package = "pipework", mustWork = TRUE)
}

is_package = function() {
  fs::file_exists("DESCRIPTION")
}

check_package = function() {
  is = is_package()
  if (is) {
    return(invisible(TRUE))
  }
  stop(
    "This does not look like a package project",
    call. = FALSE
  )
}

add_package = function(package, type = "Imports", ...) {
  suppressMessages(
    usethis::use_package(package, type, ...)
  )
  cli::cli_alert_success("Adding '{package}' to {type} in DESCRIPTION")
}

add_import = function(package, ...) {
  add_package(package)
}

add_imports = function(packages, ...) {
  purrr::walk(packages, add_import, ...)
}

add_suggests = function(package, ...) {
  add_package(package, type = "Suggests")
}