return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,  -- deshabilita el plugin -> ir a tree-sitter.lua a descomentar el requerimiento
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
      tab_char = "▏",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
