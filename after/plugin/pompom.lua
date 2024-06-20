local pompom = require('pompom')
local timer = require('pompom.timer')
vim.keymap.set("n","<leader>tt",function()
	pompom:toggle_ui()
end)

vim.keymap.set("n","<leader>tn",function()
	pompom:add_task()
end)

vim.api.nvim_create_user_command(
	"PomPomList",
	function(opts)
		pompom:use_list(opts.fargs[1])
	end,
	{nargs='?'}
)
