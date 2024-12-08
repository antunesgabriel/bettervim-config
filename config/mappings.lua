return {
  leader = " ",
  custom = {},
  by_mode = {
    n = {
      ["<leader>tf"] = {
        function()
          require("toggleterm").toggle(nil, nil, nil, "float")
        end,
        "Toggle Floating Terminal"
      },

      ["<leader>th"] = {
        function()
          require("toggleterm").toggle(nil, nil, nil, "horizontal")
        end,
        "Toggle Horizontal Terminal"
      },

      ["<leader>tv"] = {
        function()
          require("toggleterm").toggle(nil, nil, nil, "vertical")
        end,
        "Toggle Vertical Terminal"
      },

      ["<C-\\>"] = {
        function()
          require("toggleterm").toggle()
        end,
        "Toggle Terminal"
      },

      ["<C-q>"] = {
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
      },

      ["<Tab>"] = {
        function()
          require("bufferline").cycle(1)
        end,
        "Next Tab"
      },

      ["<S-Tab>"] = {
        function()
          require("bufferline").cycle(-1)
        end,
        "Previous Tab"
      },

      ['<leader>gl'] = {
        '<cmd>Gitsigns toggle_current_line_blame<CR>',
        'Toggle Git Blame (current line)'
      },

      ['<leader>gp'] = {
        '<cmd>Gitsigns preview_hunk<CR>',
        'Preview Git Hunk'
      },

      ['<leader>di'] = {
        '<cmd>Gitsigns diffthis<CR>',
        'Diff This'
      },

      ['<leader>gc'] = {
        '<cmd>Gitsigns toggle_linehl<CR>',
        'Toggle Git Linehl'
      },
    },
    i = {},
    v = {},
    x = {},
  },
}
