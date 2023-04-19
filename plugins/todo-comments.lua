return {
  "folke/todo-comments.nvim",
  ensure_installed = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup {
      -- My configuration
    }
  end,
}
