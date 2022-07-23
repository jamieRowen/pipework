pre_route = function(req, res) {
  data = parse_req_data(req)
  logger::log_info(
    method = req$REQUEST_METHOD, path = req$PATH_INFO,
    origin = req$REMOTE_ADDR,
    data = data
  )
}

post_route = function(req, res, value) {
  data = parse_req_data(req)
  response_value = value
  if (
    req$HEADERS["accept"] %in% c("test/csv", "application/pdf") &&
      !inherits(value, "error") &&
      !stringr::str_detect(req$PATH_INFO, "^/__docs__/")
  ) {
    response_value = list(value = "CSV or PDF")
  }
  log_data = list(
    method = req$REQUEST_METHOD, path = req$PATH_INFO,
    origin = req$REMOTE_ADDR,
    data = data,
    response = response_value,
    status = res$status
  )
  log_fun = if (res$status == 200) logger::log_success else logger::log_error
  do.call(log_fun, log_data)
  value
}

#' default hooks for API
#'
#' Adds a default set of hooks (currently only
#' pre route) to the API. These hooks will be used for
#' logging interactions with the running api.
#'
#' @param api a Plumber api object
#' @return a Plumber api object with added hooks
#' @export
add_default_hooks = function(api) {
  plumber::pr_hooks(
    api, list(
      preroute = pre_route,
      postroute = post_route
    )
  )
}

# extract request data from req environment (pass by reference)
parse_req_data = function(req) {
  # if POST we will have content_length > 0
  if ((is.null(req$CONTENT_LENGTH)) || as.integer(req$CONTENT_LENGTH) == 0L) {
    return(NULL)
  }
  # rewind first as well, it seems plumber does not rewind the stream
  req$rook.input$rewind()
  data = rawToChar(req$rook.input$read())
  # rewind the stream before passing it on
  # as req is env (pass by reference)
  # we need to do this to ensure the stream is available for
  # internal plumber methods/functions.
  req$rook.input$rewind()
  data = jsonlite::fromJSON(data)
  data
}
