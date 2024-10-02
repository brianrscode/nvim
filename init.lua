-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.bo

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

vim.cmd([[filetype plugin on]])

-- Cargar el árbol de archivos ftplugin
-- vim.cmd([[autocmd FileType python lua require('ftplugin.python')]])
-- vim.cmd([[autocmd FileType sh lua require('ftplugin.sh')]])
