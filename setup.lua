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
