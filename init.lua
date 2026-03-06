-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

vim.cmd([[filetype plugin on]])

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
        pcall(vim.cmd, "silent! VenvSelectCached")
    end,
})

vim.cmd([[
  augroup markdownSpell
    autocmd!
    autocmd FileType markdown,text setlocal spell spelllang=es,en
  augroup END
]])

