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
      
      ✔ Created file 'R/_logger.R'
      
      ── Adding dependencies for generated code 
      ✔ Adding 'jsonlite' to Imports in DESCRIPTION
      ✔ Adding 'logger' to Imports in DESCRIPTION
      ✔ Adding 'rlang' to Imports in DESCRIPTION
      ✔ Adding 'stringr' to Imports in DESCRIPTION
      ✔ logging can be set up with `setup_logger()`

