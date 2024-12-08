return {
  prismals = {},
  gopls = {},
  yamlls = {},
  dockerls = {},
  docker_compose_language_service = {},
  sqlls = {},
  jsonls = {},
  marksman = {},
  terraformls = {},
  tailwindcss = {},
  taplo = {},
  ruff = {
    settings = {
      interpreter = { '.venv/bin/python' }
    }
  },
  cssls = {},
  pylsp = {},
  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { '*' },
        },
      },
    },
  }
}
