return {
  "xiyaowong/nvim-transparent",
  config = function()
    require("transparent").setup {
      enable = true,
      extra_groups = {
        -- table/string: additional groups that should be cleared
      },
      excluded = {
        -- table: groups you don't want to clear
      },
    }
  end,
}
