vim.g.leader = " "

vim.keymap.set("n", "<leader>u", vim.cmd.Ex)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>x", vim.cmd.bd)
-- コピー: Visualモード
-- コピー: 全モード対応
vim.keymap.set({ "n", "v", "x", "s" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- ペースト: 全モード対応
vim.keymap.set({ "n", "v", "x", "s" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
