vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pf", ":!open -a Finder %:p:h <enter>") -- mac only, loser
vim.keymap.set("n", "]q", vim.cmd.cn)
vim.keymap.set("n", "[q", vim.cmd.cp)
