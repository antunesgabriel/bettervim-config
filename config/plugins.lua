return {
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
        start_in_insert = true,    -- Abre o terminal já em modo inserção
        toggle_in_insert = true,   -- Permite togglar no modo inserção
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
          accept_suggestion = '<C-l>',   -- Aceitar a sugestão com Ctrl + l
          clear_suggestion = '<C-h>',    -- Limpar a sugestão com Ctrl + h
          next_suggestion = '<C-j>',     -- Próxima sugestão com Ctrl + j
          prev_suggestion = '<C-k>',     -- Sugestão anterior com Ctrl + k
        },
        debounce_ms = 80,                -- Ajuste de debounce para sugestões
        highlight = {
          guifg = '#555555',             -- Cor da sugestão (pode personalizar)
        },
      })
    end,
  },
}
