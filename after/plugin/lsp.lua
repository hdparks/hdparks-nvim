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
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

lspconfig.volar.setup {
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
	init_options = {
		vue = {
			hybridMode = false
		},
	},
}
lsp.setup()

vim.keymap.set({"n","v"},"<leader>s",function() vim.lsp.buf.code_action() end)

-- Enter to select
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})
