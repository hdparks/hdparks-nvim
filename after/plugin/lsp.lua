local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_format_on_save = function(bufnr)
	vim.api.nvim_clear_autocmds({group = augroup, buffer=bufnr})
	vim.api.nvim_create_autocmd('BufWritePre', {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format()
		end,
	})
end

local lsp = require('lsp-zero')
lsp.preset("recommended")
lsp.setup()

vim.keymap.set({"n","v"},"<leader>s",function() vim.lsp.buf.code_action() end)

-- Enter to select
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})
