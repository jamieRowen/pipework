pkgload::load_all()
get_internal_routes() %>%
  create_routes() %>%
  generate_api()