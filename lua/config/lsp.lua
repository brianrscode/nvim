-- LSP and formatter setup
local M = {}

local function safe_require(name)
    local ok, mod = pcall(require, name)
    if not ok then
        return nil
    end
    return mod
end

local lspconfig = safe_require("lspconfig")
local mason_lspconfig = safe_require("mason-lspconfig")

local capabilities = vim.tbl_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    (function()
        local cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
        if cmp_nvim_lsp then
            return cmp_nvim_lsp.default_capabilities()
        end
        return {}
    end)()
)

-- Ensure snippetSupport is present as a safe fallback if cmp_nvim_lsp is absent
capabilities = capabilities or {}
capabilities.textDocument = capabilities.textDocument or {}
capabilities.textDocument.completion = capabilities.textDocument.completion or {}
capabilities.textDocument.completion.completionItem = capabilities.textDocument.completion.completionItem or {}
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Do not set LSP keymaps here; prefer global/plugin mappings (e.g. snacks.lua).
-- Ensure handlers register servers with capabilities only.
if mason_lspconfig and lspconfig then
    mason_lspconfig.setup_handlers({
        -- default handler for all servers
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end,

        -- specific config for pyright
        ["pyright"] = function()
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = { typeCheckingMode = "basic" },
                    },
                },
            })
        end,
    })
end

-- null-ls integration (formatters / linters)
local null_ls = safe_require("null-ls")
if null_ls then
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
        sources = {
            formatting.black.with({ extra_args = { "--fast" } }),
            formatting.isort,
            diagnostics.ruff,
        },
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = 0, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })
end

return M
