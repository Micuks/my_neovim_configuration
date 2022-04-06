HOME = os.getenv("HOME")

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Basic settings
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8, ucs-bom, gb18030, gbk, gb2312, cp936"
vim.o.termencoding = "utf-8"
-- vim.o.backspace = {"indene", "eol", "start"} -- enable backspace on every char in INSERT mode
-- vim.o.completeopt = { 'menuone', 'noselect' }
vim.o.history = 1000
vim.o.startofline = true

vim.o.clipboard = "unnamedplus"

-- Mapping timeout
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100

-- Display
vim.o.showmatch = true -- show matching brackets
vim.o.scrolloff = 3 -- always show 3 rows from edge of the screen
vim.o.synmaxcol = 300 -- stop syntax highlight after given lines for better performance
vim.o.laststatus = 2 -- always show state line

vim.o.list = true -- hide white characters
vim.o.foldenable = false
vim.o.foldlevel = 4 -- limit folding to 4 levels
vim.o.foldmethod = 'syntax' -- use language syntax to generate fold

vim.o.wrap = false -- don't wrap when line is too long
vim.o.eol = false -- show if there's no eol char
vim.o.showbreak= '↪' -- character to show when line is broken

vim.o.t_Co = 256


-- Sidebar
vim.o.number = true
vim.o.numberwidth = 3 -- always reserve 3 columns for line number
vim.o.signcolumn = 'yes' -- keep 1 row for coc.nvim check
vim.o.modelines = 0
vim.o.showcmd = true -- display command in bottom bar

-- Search
vim.o.incsearch = true -- start searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insensitive unless Capitals are used in search

vim.o.matchtime = 2 -- delay before showing match patten

-- white characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.formatoptions = 'qnj1' -- q - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 -don't break after one letter word
vim.o.expandtab = true -- expand tab to spaces

-- Backup files
vim.o.backup = true
vim.o.writebackup = true
vim.o.swapfile = false
vim.o.undodir = HOME .. '/.vim/tmp/undo//'
vim.o.backupdir = HOME .. '/.vim/tmp/swap//'

vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])

-- Command mode
vim.o.wildmenu = true
vim.o.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

-- vim.o.background = 'dark'
vim.cmd('colorscheme onedark')

-- auto update plugin info
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])
