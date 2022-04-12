with_temp_package = function(envir = parent.frame()) {
  wd = getwd()
  withr::defer(setwd(wd), envir = envir)

  pkg = create_tmp_package(envir = envir)
  return(wd)
}

create_tmp_package = function(envir = parent.frame()) {
  tmp = tempdir()
  # ensure empty
  files = list.files(tmp)
  purrr::walk(files, empty, dir = tmp)
  suppressMessages(usethis::create_package(tmp))
  withr::defer(delete_tmp_package(tmp), envir = envir)
  return(tmp)
}

empty = function(file, dir) {
  unlink(
    file.path(dir, file),
    recursive = TRUE, force = TRUE
  )
}

delete_tmp_package = function(dir) {
  unlink(dir, recursive = TRUE, force = TRUE)
}