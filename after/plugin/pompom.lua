local pompom = require('pompom')
vim.keymap.set("n","<leader>tt",function()
	pompom:toggle_ui()
end)
