return {
  -- https://github.com/nvim-telescope/telescope.nvim
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",  -- Es una libreria con funciones que nadie quiere volver a escribir XD
    "nvim-telescope/telescope-file-browser.nvim",  -- Permite ver los atajos asociados en telescope para poder operar
    {
      -- Es una herramienta que se puede usar para buscar archivos
      'nvim-telescope/telescope-fzf-native.nvim',  -- Ayuda a mejorar la busqueda
      build = 'make'  -- para correr make un Ubuntu se debe ejecutar sudo apt install build-essential
      -- también se necesitan dos dependencias "fd-find" y "ripgrep", ambas se instalan con "apt install"
    } },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    }
  },

  ---------------------------------------------------------------------------------
  --------------Configuración en si misma con los atajos de teclado  --------------
  ---------------------------------------------------------------------------------
  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
  keys = {
    {
      "<leader>fg",  -- find git files
      function()
        require('telescope.builtin').git_files({ show_untracked = true })
      end,
      desc = "Telescope Git Files",
    },
    {
      "<leader>fb",  -- find buffers
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>gs",  -- git status
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>gcs",  -- git commits
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>gb",  -- git branches
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Telescope Git branches",
    },
    {
      "<leader>fp",  -- find plugins
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Plugins instalados",  -- Título de la barra de busqueda
          cwd = "~/.config/nvim/lua/plugins",  -- directorio sobre el que buscará (current work directory)
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            map("i", "<c-y>", function(prompt_bufnr)  -- en modo insertar si presiono <c-y> lo que haya escrito queda como nuevo plugin
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)
              vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))  -- crea el nuevo plugin
            end)
            return true
          end
        })
      end
    },
    {
      "<leader>ff",  -- find files
      function()
        require('telescope.builtin').find_files()
      end,
      desc = "Telescope Find Files",
    },
    {
      "<leader>ft",  -- find tags -> para el help de neovim
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope Help"
    },
    {
      "<leader>fs",  -- file browser
      function()
        require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      end,
      desc = "Telescope file browser"
    }
  },
}
