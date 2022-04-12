test_that("create lock file works", {
  dir = with_temp_package()
  expect_message(create_lock_file())
  expect_true(file.exists(file.path(dir, LOCK_FILE)))
})
