return {
  plugins = {
    "folke/todo-comments.nvim",
    "mfussenegger/nvim-dap",
    "norcalli/nvim-colorizer.lua",
    "windwp/nvim-ts-autotag",
    {
      "olexsmir/gopher.nvim",
      dependecies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
      ft = "go",
      build = function()
        vim.cmd [[silent! GoInstallDeps]]
      end,
      opts = {}
    },
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = function()
        require("toggleterm").setup({
          start_in_insert = true,  -- Abre o terminal já em modo inserção
          toggle_in_insert = true, -- Permite togglar no modo inserção
          direction = 'float',
          float_opts = {
            border = 'curved',
            width = function() return math.floor(vim.o.columns * 0.6) end,
            height = function() return math.floor(vim.o.lines * 0.6) end,
          }
        })
      end,
    },
    {
      "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
      event = "TermOpen",
      requires = {
        "akinsho/nvim-toggleterm.lua",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("telescope").load_extension "toggleterm"
      end,
    },
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = '<C-l>', -- Aceitar a sugestão com Ctrl + l
            clear_suggestion = '<C-h>',  -- Limpar a sugestão com Ctrl + h
            next_suggestion = '<C-j>',   -- Próxima sugestão com Ctrl + j
            prev_suggestion = '<C-k>',   -- Sugestão anterior com Ctrl + k
          },
          debounce_ms = 80,              -- Ajuste de debounce para sugestões
          highlight = {
            guifg = '#555555',           -- Cor da sugestão (pode personalizar)
          },
        })
      end,
    },
  },
  unload_plugins = {},
  lsps = {
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
  },
  formatters = {
    goimports = {},
    gofumpt = {},
    goimports_reviser = {},
    golines = {},
    yamlfmt = {},
    -- eslint_d = {},
    -- fixjson = {},
    mdformat = {},
    prettier = {},
    prettierd = {},
    -- terrafmt = {},
    rustywind = {},
    sqlfmt = {},
    -- ruff = {},
    -- mypy = {},
    black = {},
  },
  treesitter = {},
  gitsigns = {},
  noice = {},
  theme = {
    name = "catppuccin",
    catppuccin_flavour = "mocha",
    ayucolor = "dark",
    nightfox = {},
    rose_pine = {
      dark_variant = "main",
    },
  },
  flags = {
    disable_auto_theme_loading = false,
    disable_tabs = false,
    format_on_save = true,
    experimental_tsserver = false,
  },
  hooks = {
    after_setup = function()
      require("better-vim.setup")
    end,
  },
  mappings = {
    leader = " ",
    custom = {},
    by_mode = {
      n = {
        -- Abre o terminal flutuante e entra no modo inserção
        ["<leader>tf"] = {
          function()
            require("toggleterm").toggle(nil, nil, nil, "float")
          end,
          "Toggle Floating Terminal"
        },

        -- Abre o terminal horizontal e entra no modo inserção
        ["<leader>th"] = {
          function()
            require("toggleterm").toggle(nil, nil, nil, "horizontal")
          end,
          "Toggle Horizontal Terminal"
        },

        -- Abre o terminal vertical e entra no modo inserção
        ["<leader>tv"] = {
          function()
            require("toggleterm").toggle(nil, nil, nil, "vertical")
          end,
          "Toggle Vertical Terminal"
        },

        -- Toggle do terminal com Ctrl + \
        ["<C-\\>"] = {
          function()
            require("toggleterm").toggle()
          end,
          "Toggle Terminal"
        },

        -- Fecha o terminal com Ctrl + c no modo normal
        ["<leader>tc"] = {
          function()
            vim.cmd("q!") -- Fecha o terminal atual
          end,
          "Close Terminal"
        },
        ["<leader>tt"] = {
          function()
            require("telescope").extensions.toggleterm.toggleterm()
          end,
          "List ToggleTerm Terminals"
        }
      },
      i = {},
      v = {},
      x = {},
    },
    tabs = function(tab)
      return "<leader>t" .. tab
    end,
  },
  lualine = {
    options = {},
    sections = {},
  },
  telescope = {},
  nvim_tree = {
    filters = {
      -- dotfiles = false,
      -- custom = {
      --   ".git",
      -- },
      -- git_ignored = false
      exclude = {
        ".gitignore",
        ".env",
        ".github",
        ".dockerignore"
      }
    },
    view = {},
  },
  noise = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        -- Messages shown by lsp servers
        enabled = true,
        view = "notify",
        opts = {},
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },

    messages = {
      enabled = false,             -- enables the Noice messages UI
      view = "notify",             -- default view for messages
      view_error = "notify",       -- view for errors
      view_warn = "notify",        -- view for warnings
      view_history = "messages",   -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    notify = {
      enabled = false,
      view = "notify",
    },
  },
  whichkey = {},
  dashboard = {
    header = {},
  },
}
