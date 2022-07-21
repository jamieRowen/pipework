describe(
  "add_logging()", {
    it("will error when package is not pipework project", {
      ppath = with_temp_package()
      expect_error(#error = TRUE, {
        add_logging()
      #}
      )
    })
    it("successfully adds logging functions to an existing pipework project", {
      ppath = with_temp_package()
      create_lock_file()
      expect_message({
        add_logging()
      })
      expect_true(file.exists(file.path(ppath, "R", "logger_.R")))
    })
  }
)

describe(
  "add_entrypoint()", {
    it("will error when package is not a pipework project", {
      ppath = with_temp_package()
      expect_error(#error = TRUE, {
        add_entrypoint()
      #}
      )
    })
    it("successfully adds entrypoint to root of exsiting pipework project", {
      ppath = with_temp_package()
      create_lock_file()
      expect_message({
        add_entrypoint()
      })
      expect_true(file.exists(file.path(ppath, "entrypoint.R")))
    })
  }
)