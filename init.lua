-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

vim.cmd([[filetype plugin on]])

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "scss",
        "less",
        "json",
        "yaml",
        "markdown",
    },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

vim.cmd([[
  augroup markdownSpell
    autocmd!
    autocmd FileType markdown,text setlocal spell spelllang=es,en
  augroup END
]])

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    once = true,
    callback = function()
        local ok_lazy, lazy = pcall(require, "lazy")
        if ok_lazy then
            lazy.load({ plugins = { "nvim-lspconfig", "mason-lspconfig.nvim" } })
        end
        pcall(require, "config.lsp")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "git",
        "fugitive",
        "lspinfo",
        "help",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})
