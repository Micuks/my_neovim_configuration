return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- common
  use 'wakatime/vim-wakatime'
  use 'nvim-lualine/lualine.nvim'

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  use 'nvie/vim-flake8'

  use 'tpope/vim-vinegar'
  -- use 'preservim/nerdtree'
  -- use 'Xuyuanp/nerdtree-git-plugin'
  -- use 'ryanoasis/vim-devicons'
  -- use 'tiagofumo/vim-nerdtree-syntax-highlight'
  -- use 'PhilRunninger/nerdtree-buffer-ops'
  -- use 'PhilRunninger/nerdtree-visual-selection'
  -- use 'jistr/vim-nerdtree-tabs'

  -- Color Schemes
  use 'sainnhe/sonokai'
  use {'sonph/onehalf', rtp = 'vim'}
  use 'joshdick/onedark.vim'

  use 'xiyaowong/nvim-transparent'

  -- dev requires

  -- Enhanced highlight
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- List of parsers to ignore installing
    ignore_install = { "rust" },

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = { "rust" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }

  -- Auto pair
  use 'jiangmiao/auto-pairs'

  -- IndentLine
  use 'Yggdroot/indentLine'

  -- Display function signatures from completions in the command line
  use 'Shougo/echodoc.vim'
  --
  -- LeaderF
  use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }

  -- Enhanced keybinds
  use 'tpope/vim-unimpaired'

  -- New objects
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-indent'
  use 'kana/vim-textobj-syntax'
  use { 'kana/vim-textobj-function', ft = {'c', 'cpp', 'vim', 'java'} }

  -- ctags
  use 'universal-ctags/ctags'
  use 'ludovicchabant/vim-gutentags'

  -- Code Analysis
  -- use 'dense-analysis/ale'

  -- Coc Plugin
  use {'neoclide/coc.nvim', branch = 'release'}

  -- VimSpector
  use 'puremourning/vimspector'

  -- MD preview
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
  use {"ellisonleao/glow.nvim"}

  -- Asyncrun
  use 'skywind3000/asyncrun.vim'

  use "Pocco81/AutoSave.nvim"
  local autosave = require("autosave")

  autosave.setup(
  {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave", "TextChanged"},
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
  }
  )

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
end)
