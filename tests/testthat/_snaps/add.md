# add_logging(): will error when package is not pipework project

    Code
      add_logging()
    Error <simpleError>
      This is not a pipework project, see `lay_pipework()`

# add_logging(): successfully adds logging functions to an existing pipework project

    Code
      add_logging()
    Message <cliMessage>
      
      ── Adding logging tools ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
      
      ── Generating code ──
      
      ✔ Created file 'R/logger_.R'
      
      ── Adding dependencies for generated code 
      ✔ Adding 'jsonlite' to Imports in DESCRIPTION
      ✔ Adding 'logger' to Imports in DESCRIPTION
      ✔ Adding 'rlang' to Imports in DESCRIPTION
      ✔ Adding 'stringr' to Imports in DESCRIPTION
      ✔ logging can be set up with `setup_logger()`

# add_entrypoint(): will error when package is not a pipework project

    Code
      add_entrypoint()
    Error <simpleError>
      This is not a pipework project, see `lay_pipework()`

# add_entrypoint(): successfully adds entrypoint to root of exsiting pipework project

    Code
      add_entrypoint()
    Message <cliMessage>
      
      ── Adding API entrypoint ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
      
      ── Generating code ──
      
      ✔ Created file './entrypoint.R'
    Message <rlang_message>
      ✔ Adding 'magrittr' to Imports field in DESCRIPTION
      ✔ Writing 'R/utils-pipe.R'
      • Run `devtools::document()` to update 'NAMESPACE'

