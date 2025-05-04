require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.diagnostic.config({
  virtual_text = {
    -- Set this to true to enable wrapping of virtual text
    wrap = true,
    -- You can also control the spacing and other aspects
    spacing = 2,
    severity_sort = true,
  },
})
