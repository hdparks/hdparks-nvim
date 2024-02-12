local pompom = require('pompom')
vim.keymap.set("n","<leader>tt",function()
	pompom:toggle_ui()
end)

vim.keymap.set("n","<leader>tn",function()
	pompom:add_task()
end)
