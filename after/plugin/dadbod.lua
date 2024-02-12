vim.api.nvim_create_autocmd("FileType",{
	pattern={'sql'},
	callback = function()
		require("cmp").setup.buffer({ sources= {{name = "vim-dadbod-completion"}} })
	end,
	--- should I do something with augroups here? 
})
