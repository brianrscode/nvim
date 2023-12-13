return {
  -- https://github.com/iamcco/markdown-preview.nvim
  -- Muestra un preview de un archivo markdown
  "iamcco/markdown-preview.nvim",
  cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop"
  },
  ft = {
    "markdown"
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
