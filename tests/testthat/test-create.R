test_that("create from template", {
  ppath = with_temp_package()
  expect_message(create_from_template("R", "_generate_api.R"))
  expect_true(file.exists(file.path(ppath, "R", "_generate_api.R")))

  # using non default target name
  create_from_template("R", "_generate_api.R", target_name = "test_name.R")
  expect_true(file.exists(file.path(ppath, "R", "test_name.R")))
})
