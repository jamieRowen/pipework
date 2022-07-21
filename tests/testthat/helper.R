delete_tmp_package = function(dir) {
  unlink(dir, recursive = TRUE, force = TRUE)
}

create_tmp_package = function(envir = parent.frame()) {
  tmp = tempdir()
  pdir = file.path(tmp, "package")
  dir.create(pdir)
  # ensure empty
  purrr::walk(list.files(pdir), empty, dir = pdir)
  op = options(usethis.quiet = TRUE)
  suppressMessages(ppath <- usethis::create_package(pdir, open = FALSE)) # nolint undesirable_object_linter
  options(op)
  withr::defer(delete_tmp_package(pdir), envir = envir)
  return(ppath)
}

with_temp_package = function(envir = parent.frame()) {
  wd = getwd()
  # active_project = usethis::proj_get()
  withr::defer(setwd(wd), envir = envir)
  # withr::defer(usethis::proj_activate(active_project), envir = envir)
  pkg = create_tmp_package(envir = envir)
  setwd(pkg)
  usethis::proj_activate(".")
  return(pkg)
}


empty = function(file, dir) {
  unlink(
    file.path(dir, file),
    recursive = TRUE, force = TRUE
  )
}
