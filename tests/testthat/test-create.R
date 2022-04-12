test_that("create from template", {
  ppath = with_temp_package()
  # fails without pipework lock file
  expect_error(create_from_template("R", "_generate_api.R"))

  create_lock_file()
  expect_message(create_from_template("R", "_generate_api.R"))
  expect_true(file.exists(file.path(ppath, "R", "_generate_api.R")))

  # using non default target name
  create_from_template("R", "_generate_api.R", target_name = "test_name.R")
  expect_true(file.exists(file.path(ppath, "R", "test_name.R")))
})

test_that("create route directory", {
  ppath = with_temp_package()
  # fails without pipework lock file
  expect_error(create_routes_dir())

  create_lock_file()
  expect_message(create_routes_dir())
  expect_true(dir.exists("./inst/extdata/api/routes"))
})
