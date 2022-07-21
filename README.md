# Pipework

A package for creating [Plumber](https://www.rplumber.io/) APIs as packages.

This package is very much inspired by [{leprechaun}](https://leprechaun.opifex.org/#/) and [{golem}](https://thinkr-open.github.io/golem/). The aim
is to allow a plumber application to be contained in a package in order
to leverage all of the benefits such as testing and documentation of R
code. As such this is just one persons opinion on how a plumber application
can be contained within an R package structure.

Like `{leprechaun}`, this aims to be a solution that leaves the final package without
a dependency on `{pipework}`.

## Getting started

`{pipework}` starts with the assumption that you already have an R package structure in place.
I recommend the excellent `{usethis}` package if you want to instantiate a new package.

``` R
# Optionally create a package
# usethis::create_package(".")

# Start a pipework project
pipework::lay_pipework()
```

This has the effect of adding the location inside the `inst/` directory of your package
for adding routes. Adding source code to your `R/` directory that will
allow you to build a plumber object from those routes and add necessary
dependencies to your DESRIPTION file.

## Templated files

The files added to your package from the templates inside {pipework} will
end in an underscore, e.g `"R/generate_api_.R"`. These files are not intended to be modified by a user. Although nothing would prevent you from doing so.

## entrypoint

We can add an entrypoint to run our application by `add_entrypoint()`. This entrypoint script will be a runnable script that would create your plumber object.

This entrypoint.R file is already in the format that RStudio Connect might expect. To run the API locally

``` R
api = plumber::pr("entrypoint.R")
plumber::pr_run(api)
```

## Logging

You can add a [{logger}](https://daroczig.github.io/logger/) to your project with `add_logging()`.

This gives the tools to set up and use a logger.
`setup_logger()` in your entrypoint to the API will set a directory (default "./API_logs") with rotating log files and a custom JSON layout for those log files.

The logger setup also provides `with_log_handle(expr)` which can be used internally to log any expressions.