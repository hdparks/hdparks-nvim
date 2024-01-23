local pompom = require('pompom')

pompom:setup({
})

local utils = require('pompom.utils')
vim.keymap.set("n","<leader>tt",function()
	vim.api.nvim_command('echomsg "pompom!!"')
	pompom.ui:toggle_quick_menu(pompom:list())
	--os.execute('say "ding dong break time"')
	--os.execute('notify "ding dong break time"')
end)
vim.keymap.set("n","<leader>tg",function()
	utils.run_interval(
		1000,
		function()
			print('hi!')
		end,
		function()
			return true
		end
	)
end)
