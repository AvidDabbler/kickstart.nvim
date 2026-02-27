return {
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat" },
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", mode = { "n", "v" } },
      { "<leader>ci", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Inline", mode = { "n", "v" } },
    },
    opts = {
      prompt_library = {
          markdown = {
            dirs = {
              vim.fn.getcwd() .. "/.prompts", -- Can be relative
              "~/.dotfiles/.config/prompts", -- Or absolute paths
          },
        },
      },
      adapters = {
        http = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://100.88.189.25:11434",
              },
              parameters = {
                sync = true,
              },
            })
          end,
        },
      },
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
        agent = { adapter = "ollama" },
      },
      opts = {
        log_level = "DEBUG",
      },
    },
  },
}


