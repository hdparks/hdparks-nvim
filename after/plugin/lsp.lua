require('neodev').setup({})
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
--  lua setup
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.keymap.set({"n","v"},"<leader>s",function() vim.lsp.buf.code_action() end)

-- Enter to select
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})
