-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Example setup for Go, TS, etc.
      lspconfig.gopls.setup({})
      lspconfig.ts_ls.setup({})

      -- Safe hover helper
      local function has_hover(bufnr)
        for _, c in pairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
          if c.server_capabilities and c.server_capabilities.hoverProvider then
            return true
          end
        end
        return false
      end

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf

          local function buf_map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- SAFE Hover
          buf_map("n", "K", function()
            if not has_hover(bufnr) then
              -- fallback if you want, otherwise just return
              -- vim.cmd('normal! K')
              return
            end
            local ok, saga_hover = pcall(require, "lspsaga.hover")
            if ok and saga_hover and saga_hover.render_hover_doc then
              pcall(function() saga_hover:render_hover_doc() end)
            else
              pcall(vim.lsp.buf.hover)
            end
          end, "LSP: Hover (safe)")

          -- Usual LSP keymaps
          buf_map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
          buf_map("n", "gr", vim.lsp.buf.references, "Goto References")
          buf_map("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
          buf_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        end,
      })
    end,
  },
}
