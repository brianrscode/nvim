local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	-- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	vim.keymap.set(mode, lhs, rhs, options)
end

function CustomActionsBasedOnFileType()
	local filetype = vim.bo.filetype

	if filetype == "python" then
		-- "Espacio + o" Agrega : al final de la línea y da un salto
		map("n", "<leader>o", "A:<ENTER><Esc>O")
	else
		-- "Espacio + o" Agrega una { al final de la línea y da un salto
		map("n", "<leader>o", "A{<ENTER>}<Esc>O")
	end
end

----------------------
----------------------
-- Neovim shortcuts --
----------------------
----------------------

-- Disable arrow keys in mode Insert and Read
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

-- Map Esc to jj
-- Mapea "jj" en el modo de inserción para remplazarla por un escape <esc>
map("i", "jj", "<Esc>")

map("n", "<C-j>", "10<C-e>") -- Baja 10 líneas
map("n", "<C-k>", "10<C-y>") -- Sube 10 líneas

map("n", "<leader>w", "<cmd>:w<CR>") -- "Espacio + w" guarda el documento
map("n", "<leader>q", "<cmd>:q<CR>") -- "Espacio + q" cierra el documento

map("n", "<leader>i", "A;<ENTER>") -- "Espacio + i" Agrega un ; al final de la línea y da un salto
vim.cmd([[autocmd BufEnter * lua CustomActionsBasedOnFileType()]]) -- Llama a la función cada que cambio de buffer
-- map("n", "<leader>o", "A{<ENTER>}<Esc>O") -- "Espacio + o" Agrega un { al final de la línea y da un salto

map("n", "<C-b>", "<cmd>:NvimTreeToggle<CR>") -- Muestra/oculta el árbol de archivos

map("n", "<leader><Tab>", "<cmd>:BufferLineCycleNext<CR>") -- Cambia al buffer siguiente
map("n", "<C-w>", "<cmd>:BufferLinePickClose<CR>") -- Coloca la opción de eliminar un buffer seleccionado

map("v", ">", ">gv") -- Tabula hacia la derecha
map("v", "<", "<gv") -- Tabula hacia la izquierda
