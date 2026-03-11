return {
  {
    "github/copilot.vim",
    branch = "release",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true 
      vim.keymap.set("i", "<S-CR>", 'copilot#Accept("\\<CR>")', {
         expr = true,
         replace_keycodes = false,
       })
    end,
  },

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
      { "<leader>ct", "<cmd>CodeCompanion toggle<cr>", desc = "CodeCompanion toggle chat", mode = { "n", "v" } },
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
              schema = {
                model = {
                  default = "qwen3-coder-30b-ctx", -- set your desired model here
                },
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


