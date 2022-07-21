test_that("create from template", {
  ppath = with_temp_package()
  # fails without pipework lock file
  expect_error(create_from_template("R", "generate_api_.R"))

  create_lock_file()

  expect_message(create_from_template("R", "generate_api_.R"))
  expect_true(file.exists(file.path(ppath, "generate_api_.R")))

  expect_message(create_from_template("R", "generate_api_.R", target_dir = "R"))
  expect_true(file.exists(file.path(ppath, "R", "generate_api_.R")))

  # using non default target name
  create_from_template("R", "generate_api_.R", target_name = "test_name.R", target_dir = "R")
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
