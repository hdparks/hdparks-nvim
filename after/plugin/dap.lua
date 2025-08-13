local dap = require('dap')
dap.adapters.coreclr = {
	type = 'executable',
	command = '/usr/local/netcoredbg/netcoredbg',
	args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/Istari/Istari.Shadowfax/bin/Debug/net6.0/Istari.Shadowfax.dll', 'file')
		end,
	},
}

-- vim.keymap.set("n","<leader>b",function() require'dap'.toggle_breakpoint() end)
-- Note: gonna conflict with markdown <leader>d to toggle "done" -- maybe find different dap leader key
-- vim.keymap.set("n","<leader>dr",function() require'dap'.repl.open() end)

local dapui = require('dapui')

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		expand = { "<CR>"},
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expanded_lines = true,
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
