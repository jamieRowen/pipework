describe("has_logging()", {
  ppath = with_temp_package()
  it("errors if not a pipework project", {
    expect_error(has_logging())
  })
  create_lock_file()
  it("returns FALSE if R/logger_.R not present", {
    expect_false(has_logging())
  })
  it("returns TRUE after add_logging()", {
    add_logging()
    expect_true(has_logging())
  })
})

describe("has_entrypoint()", {
  ppath = with_temp_package()
  it("errors if not a pipework project", {
    expect_error(has_entrypoint())
  })
  create_lock_file()
  it("returns FALSE if entrypoint.R not present", {
    expect_false(has_entrypoint())
  })
  it("returns TRUE after add_entrypoint()", {
    add_entrypoint()
    expect_true(has_entrypoint())
  })
})

describe("has_hooks()", {
  ppath = with_temp_package()
  it("errors if not a pipework project", {
    expect_error(has_hooks())
  })
  create_lock_file()
  it("returns FALSE if entrypoint.R not present", {
    expect_false(has_hooks())
  })
  it("returns TRUE after add_entrypoint()", {
    # not yet implemented
    # add_hooks()
    # expect_true(has_hooks())
  })
})