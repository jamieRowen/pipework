describe(
  "add_logging()", {
    it("will error when package is not pipework project", {
      ppath = with_temp_package()
      expect_snapshot(error = TRUE, {
        add_logging()
      })
    })
    it("successfully adds logging functions to an existing pipework project", {
      ppath = with_temp_package()
      create_lock_file()
      expect_snapshot({
        add_logging()
      })
      expect_true(file.exists(file.path(ppath, "R", "_logger.R")))
    })
  }
)