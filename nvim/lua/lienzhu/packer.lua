vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --[[
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      tag = 'v0.1.0', -- Optional tag release
      config = function()
          vim.cmd('colorscheme rose-pine')
      end
  })
  ]]

  use "rebelot/kanagawa.nvim"

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
end)
