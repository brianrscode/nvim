return {
  -- https://github.com/rcarriga/nvim-notify
  "rcarriga/nvim-notify",
  event = "VeryLazy",  -- Cuando se cargue el editor se notify
  config = function ()
    local notify = require "notify"
    -- notify.setup {}  -- Esto es para transparencia
    vim.notify = notify.notify
  end
}
