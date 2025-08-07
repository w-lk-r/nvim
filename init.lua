require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>")

-- Disable arrow keys in all modes
vim.keymap.set({ 'n', 'i', 'v', 'c' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v', 'c' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v', 'c' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v', 'c' }, '<Right>', '<Nop>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.diagnostic.config({
  virtual_text = {
    -- Set this to true to enable wrapping of virtual text
    wrap = true,
    -- You can also control the spacing and other aspects
    spacing = 2,
    severity_sort = true,
    max_width = 80,
  },
})
