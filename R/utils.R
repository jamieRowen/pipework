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