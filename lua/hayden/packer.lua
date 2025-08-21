local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({'nvim-treesitter/nvim-treesitter', run=':TSUpdate'})
	use('nvim-treesitter/playground')
	use('ThePrimeagen/vim-apm')
	use{'ThePrimeagen/harpoon',
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} },
	}
    use('neovim/nvim-lspconfig')
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use('MunifTanjim/prettier.nvim')
	use('tpope/vim-fugitive')
	use('tpope/vim-commentary')
	use('tpope/vim-dadbod')
	use('kristijanhusak/vim-dadbod-ui')
	use('kristijanhusak/vim-dadbod-completion')
	use {
		'epwalsh/obsidian.nvim',
		requires={{"nvim-lua/plenary.nvim"}}
	}
	use('nvim-tree/nvim-web-devicons')
	use {
		'linguini1/pulse.nvim',
		config=function() require('pulse').setup() end
	}
	--use('hdparks/pompom')
    use('~/github/pompom')
	use('mfussenegger/nvim-dap')
	use { "rcarriga/nvim-dap-ui", requires={"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
	use('dhruvasagar/vim-table-mode')
    use('github/copilot.vim')
    use('hrsh7th/nvim-cmp')
    use('mason-org/mason.nvim')
    use({'rose-pine/neovim', as = 'rose-pine' })

end)
