-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.bo

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

vim.cmd([[filetype plugin on]])

vim.cmd([[
  augroup markdownSpell
    autocmd!
    autocmd FileType markdown,text setlocal spell spelllang=es,en
  augroup END
]])

