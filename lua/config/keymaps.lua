local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, options)
end

----------------------------------------------------------
-------------------- Neovim shortcuts --------------------
----------------------------------------------------------

-- Disable arrow keys in mode Insert and Read
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

-- Mapea "jj" en el modo de inserción para remplazarla por un escape <esc>
map("i", "jj", "<Esc>")

---------- MOVIMIENTOS ----------
map("n", "<C-j>", "10<C-e>") -- Baja 10 líneas
map("n", "<C-k>", "10<C-y>") -- Sube 10 líneas

---------- GUARDAR Y CERRAR ----------
map("n", "<leader>w", "<cmd>:w<CR>") -- "Espacio + w" guarda el documento
map("n", "<leader>q", "<cmd>:q<CR>") -- "Espacio + q" cierra el documento

---------- ÁROL DE ARCHIVOS ----------
map("n", "<C-tab>", "<cmd>:BufferLineCycleNext<CR>") -- va al buffer siguiente
map("n", "<C-s-tab>", "<cmd>:BufferLineCyclePrev<CR>") -- va al buffer anterior
map("n", "<C-w>", "<cmd>:BufferLinePickClose<CR>") -- Coloca opción eliminar buffer

map("v", "<", "<gv") -- Tabula hacia la izquierda

map("n", "<leader>o", "A:<ENTER>") -- <Esc>O
map("n", "<leader>i", "A,<ENTER>")
