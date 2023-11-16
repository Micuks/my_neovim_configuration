local function map(mode, key, command, opts) vim.api.nvim_set_keymap(mode, key, command, opts or { noremap = true }) end

local function nmap(key, command) map("n", key, command) end

local function vmap(key, command) map("v", key, command) end

if vim.fn.exists "g:vscode" then
  nmap("j", "gj")
  nmap("k", "gk")
  nmap("0", "g0")
  nmap("$", "g$")

  vmap("j", "gj")
  vmap("k", "gk")
  vmap("0", "g0")
  vmap("$", "g$")
end
