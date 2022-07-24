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
    it("warns when logging is already present", {
      ppath = with_temp_package()
      create_lock_file()
      add_logging()
      expect_warning({
        add_logging()
      })
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
     it("warns when entrypoint is already present", {
      ppath = with_temp_package()
      create_lock_file()
      add_entrypoint()
      expect_warning({
        add_entrypoint()
      })
    })
  }
)

describe(
  "add_route()", {
    it("will error when package is not a pipework project", {
      expect_error(add_route())
    })
    add_lockfile()
    it("will add the plumber route file if it doesn't exist", {

    })
    it("will add the R/api_X file if it doesn't exist", {

    })
    it("will add the R/X file it if doesn't exist", {

    })
    it("generates get endpoints", {

    })
    it("generates post endpoints", {
      
    })
    it("generates @get is_alive", {

    })
    it("generates @get test/is_alive", {

    })
    it("generates @get nested/test/is_alive", {
      
    })
  }
)

describe(
  "add_hooks()", {
    it("will error when package is not a pipework project", {
      ppath = with_temp_package()
      expect_error(
        add_hooks()
      )
    })
    it("successfully adds hooks to existing pipework project
    that has logging", {
      ppath = with_temp_package()
      create_lock_file()
      add_logging()
      expect_message({
        add_hooks()
      })
      expect_true(file.exists(file.path(ppath, "R", "hooks_.R")))
    })
    it("succesfully adds hooks and logging to project that had neither", {
      ppath = with_temp_package()
      create_lock_file()
      expect_message({
        add_hooks()
      })
      expect_true(file.exists(file.path(ppath, "R", "logger_.R")))
      expect_true(file.exists(file.path(ppath, "R", "hooks_.R")))
    })
    it("warns when adding hooks to project that already has them", {
      ppath = with_temp_package()
      create_lock_file()
      add_hooks()
      expect_warning({
        add_hooks()
      })
    })
  }
)