return {
  opt = {
    relativenumber = false, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = true,
    autowrite = true,
    autowriteall = true,
    autoread = true,

    conceallevel = 2, -- enable conceal
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    showbreak = "↪ ",
    showtabline = 1,
    spellfile = vim.fn.expand "~/.config/nvim/lua/user/spell/en.utf-8.add",
    swapfile = false,
    thesaurus = vim.fn.expand "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
  },
  g = {
    resession_enabled = true,

    -- TexVim zone
    tex_flavor = "latex", -- Default tex file format
    vimtex_view_method = "skim", -- Choose skim as PDF viewer
    vimtex_view_skim_sync = true, -- Value true allows forward search after every successful compilation
    vimtex_view_skim_activate = true, -- Value true allows change focus to skim after command `:VimtexView`
    vimtex_quickfix_ignore_filters = {
      "Marginpar on page",
      "CJK",
      "hbox",
    },
    -- Neovim-transparent
    transparent_enabled = true,

    -- Let treesitter handle latex syntex
    vimtex_syntex_enabled = false,
  },
}
