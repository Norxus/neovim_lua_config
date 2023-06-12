vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  
  use 'wbthomason/packer.nvim'
  
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  
	  requires = { {'nvim-lua/plenary.nvim'}}
  }

  use "lukas-reineke/indent-blankline.nvim"

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {
          check_ts = true,
          ts_config = {
              lua = { "string", "source" },
              javascript = { "string", "template_string" },
              java = false,
          },
          disable_filetype = { "TelescopePrompt", "spectre_panel" },
          fast_wrap = {
              map = "<M-e>",
              chars = { "{", "[", "(", '"', "'" },
              pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
              offset = 0, 
              end_key = "$",
              keys = "qwertyuiopzxcvbnmasdfghjkl",
              check_comma = true,
              highlight = "PmenuSel",
              highlight_grey = "LineNr",
          },
      } end
  }

  use({
      'ellisonleao/gruvbox.nvim',
      as = 'gruvbox',
      config = function()
          require("gruvbox").setup({
              undercurl = true,
              underline = true,
              bold = true,
              italic = {
                  strings = true,
                  comments = true,
                  operators = false,
                  folds = true,
              },
              strikethrough = true,
              invert_selection = false,
              invert_signs = false,
              invert_tabline = false,
              invert_intend_guides = false,
              inverse = true, -- invert background for search, diffs, statuslines and errors
              contrast = "", -- can be "hard", "soft" or empty string
              palette_overrides = {},
              overrides = {},
              dim_inactive = false,
              transparent_mode = false,
          })
          vim.cmd("colorscheme gruvbox")
      end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          {'neovim/nvim-lspconfig'},
          {
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup()
      end
  }

  use {
      'nvim-tree/nvim-tree.lua',
       config = function ()
          require("nvim-tree").setup({
              sort_by = "case_sensitive",
              view = {
                  width = 30,
              },
              renderer = {
                  group_empty = true,
              },
              filters = {
                  dotfiles = true,
              },
          })
      end
  }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup({
          size = 20,
          open_mapping = [[<c-\>]],
          hide_numbers = true,
          shade_filetypes = {},
          shade_terminals = true,
          shading_factor = 2,
          start_in_insert = true,
          insert_mappings = true,
          persist_size = true,
          direction = "float",
          close_on_exit = true,
          shell = vim.o.shell,
          float_opts = {
              border = "curved",
              winblend = 0,
              highlights = {
                  border = "Normal",
                  background = "Normal",
              },
          },
      })
  end}

  use {
      "ahmedkhalf/project.nvim",
      config = function()
          require("project_nvim").setup {
              active = true,
              on_config_done = nil,
              manual_mode = false,
              detection_methods = { "pattern" },
              patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
              show_hidden = false,
              silent_chdir = true,
              ignore_lsp = {},
              datapath = vim.fn.stdpath("data"),
          }
      end
  }
end)
