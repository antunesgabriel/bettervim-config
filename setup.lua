function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }

  -- Sai do terminal mode com <Esc>
  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

  -- Toggle do terminal com Ctrl + \
  vim.keymap.set('t', '<C-\\>', function()
    require("toggleterm").toggle()
  end, opts)

  vim.keymap.set('t', '<C-q>', function()
    vim.cmd('q!')
  end, opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local function is_wsl()
  local output = vim.fn.systemlist("uname -r")[1]
  return string.find(output:lower(), "microsoft") ~= nil
end

if is_wsl() then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
    dlv = "dlv",
  },
  gotests = {
    -- gotests doesn't have template named "default" so this plugin uses "default" to set the default template
    template = "default",
    -- path to a directory containing custom test code templates
    template_dir = nil,
    -- switch table tests from using slice to map (with test name for the key)
    -- works only with gotests installed from develop branch
    named = false,
  },
  gotag = {
    transform = "snakecase",
  },
}

require('nvim-ts-autotag').setup({
  filetypes = { "html", "xml", "tsx", "jsx" },
})

require 'colorizer'.setup({
  '*',    -- Highlight all files, but customize some others.
  '!vim', -- Exclude vim from highlighting.
}, { css_fn = true, names = true })

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'supermaven' }, -- Adicione Supermaven como uma fonte
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),             -- Mostrar sugestões manualmente
    ['<C-e>'] = cmp.mapping.close(),                    -- Fechar o menu de autocomplete
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar sugestão
  },
})
