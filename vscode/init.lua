if vim.g.vscode then
  local n_keymap = function(lhs, rhs) vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true }) end
  n_keymap("j", "gj")
  n_keymap("k", "gk")
end
