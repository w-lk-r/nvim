return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/lub/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {}

      require("lspconfig").ts_ls.setup {}
      require("lspconfig").jsonls.setup {

      }


      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          else
            print("No formatter")
          end
        end,
      })
    end,
  }
}
