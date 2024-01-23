vim.api.nvim_create_autocmd("FileType",{
	pattern={'sql'},
	callback = function()
		print("Bold move, Mr. Raynor; harvesting from two Terazine tanks at once!")
		require("cmp").setup.buffer({ sources= {{name = "vim-dadbod-completion"}} })
	end,
	--- should I do something with augroups here? 
})
