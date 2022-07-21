test_that("is pipework", {
  ppath = with_temp_package()
  expect_false(is_pipework())
  create_lock_file()
  expect_true(is_pipework())
})

test_that("check pipework", {
  with_temp_package()
  expect_error(check_pipework())
  create_lock_file()
  expect_true(check_pipework())
})

test_that("build ignore pipework", {
  dir = with_temp_package()
  create_lock_file()
  expect_message(build_ignore_pipework())

  ignore_file = file.path(dir, ".Rbuildignore")
  x = readLines(ignore_file)
  expect_true("^\\.pipework$" %in% x)
})

test_that("template_file", {
  expect_error(template_file("R", "fake.R"))
  expect_type(template_file("R", "generate_api_.R"), "character")
})
