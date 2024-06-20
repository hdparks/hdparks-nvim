local harpoon = require('harpoon')

-- Required
harpoon:setup({
	settings = {
		save_on_toggle = true,
	}
})
-- Required


vim.keymap.set("n","<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n","<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n","<leader>q", function () harpoon:list():select(1) end)
vim.keymap.set("n","<leader>w", function () harpoon:list():select(2) end)
vim.keymap.set("n","<leader>e", function () harpoon:list():select(3) end)
vim.keymap.set("n","<leader>r", function () harpoon:list():select(4) end)
