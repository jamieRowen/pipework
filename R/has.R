has = function(...) {
  check_pipework()
  file.exists(file.path(...))
}

has_logging = function() {
  has("R", "logger_.R")
}

has_entrypoint = function() {
  has("entrypoint.R")
}

has_hooks = function() {
  has("R", "hooks_.R")
}
