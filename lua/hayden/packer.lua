vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({ 'rose-pine/neovim', 
	as = 'rose-pine', 
	config=function()
		vim.cmd('colorscheme rose-pine')
	end
	})
	use('nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})
	use('nvim-treesitter/playground')
	use('ThePrimeagen/vim-apm')
	use{'ThePrimeagen/harpoon',
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} },
	}
	use {
		  'VonHeikemen/lsp-zero.nvim',
		  branch = 'v2.x',
		  requires = {
		    -- LSP Support
		    {'neovim/nvim-lspconfig'},             -- Required
		    {                                      -- Optional
		      'williamboman/mason.nvim',
		      run = function()
			pcall(vim.api.nvim_command, 'MasonUpdate')
		      end,
		    },
		    {'williamboman/mason-lspconfig.nvim'}, -- Optional

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},     -- Required
		    {'hrsh7th/cmp-nvim-lsp'}, -- Required
		    {'L3MON4D3/LuaSnip'},     -- Required
	    }
	}
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
	use('folke/neodev.nvim')
	use {
		'epwalsh/obsidian.nvim', tag="*",
		requires={{"nvim-lua/plenary.nvim"}}
	}
	use('nvim-tree/nvim-web-devicons')
	use{'pwntester/octo.nvim',
		requires= {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'nvim-tree/nvim-web-devicons',
		}
	}
	--use('hdparks/pompom')
	use("~/github/pompom")

end)
