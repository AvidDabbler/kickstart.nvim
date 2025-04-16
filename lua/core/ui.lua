return {
  {
    'folke/noice.nvim',
    opts = function(_, opts)
      -- 🔥 Ensure `opts.presets` is initialized before modifying
      opts.presets = opts.presets or {}
      opts.presets.lsp_doc_border = true

      -- 🔥 Ensure `opts.routes` is a table before inserting
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        filter = {
          event = 'notify',
          find = 'No information available',
        },
        opts = { skip = true },
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function(_, opts)
      local logo = [[

              ████████            ████████
                ██                ██    ██
                ▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒  ████
              ▒▒▒▒            ▒▒▒▒▒▒
    ████████▒▒▒▒▒▒          ▒▒▒▒██▒▒██████
  ████    ▒▒▒▒██▒▒▒▒      ▒▒▒▒████▒▒▒▒  ████
████    ▒▒▒▒  ████▒▒    ▒▒▒▒████    ▒▒    ████
██      ▒▒      ██▒▒  ▒▒▒▒  ██      ▒▒      ██
██      ▒▒▒▒▒▒▒▒▒▒▒▒██▒▒    ██      ▒▒      ██
██              ██  ██      ██              ██
████          ████  ██      ████          ████
  ████      ████              ████      ████
    ██████████                  ██████████

      ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'

      -- 🔥 Ensure `opts.config` is a table before modifying
      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, '\n')
    end,
  },
}
