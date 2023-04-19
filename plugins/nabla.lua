return {
  "jbyuki/nabla.nvim",
  enable = false,
  config = function()
    -- Disable virtual text
    require("nabla").disable_virt()
  end,
}
