return {
  "jbyuki/nabla.nvim",
  enabled = false,
  config = function()
    -- Disable virtual text
    require("nabla").disable_virt()
  end,
}
