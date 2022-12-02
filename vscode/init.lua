_G.vscodeNeovim = {}

local maps = { i = {}, n = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- Normal --
-- Standard Operations
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit" }
maps.n["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" }
maps.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["gx"] = { function() astronvim.system_open() end, desc = "Open the file under cursor with system app" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["Q"] = "<Nop>"

-- Splits
maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }

-- Stay in indent mode
maps.v["<"] = { "<gv", desc = "unindent line" }
maps.v[">"] = { ">gv", desc = "indent line" }

-- Improved Terminal Navigation
maps.t["<C-h>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window navigation" }

local map = vim.keymap.set

function vscodeNeovim.set_mappings(map_table, base)
    -- iterate over the first keys for each mode
    for mode, map_entry in pairs(map_table) do
        -- iterate over each keybinding set in the current mode
        for keymap, options in pairs(map_entry) do
            -- build the options for the command accordingly
            if options then
                local cmd = options
                local keymap_opts = base or {}
                if type(options) == "table" then
                    cmd = options[1]
                    keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
                    keymap_opts[1] = nil
                end
                -- extend the keybinding options with the base provided and set the mapping
                map(mode, keymap, cmd, keymap_opts)
            end
        end
    end
end

vscodeNeovim.set_mappings(maps)

-- function map(mode, shortcut, command)
--     vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
-- end
--
-- function nmap(shortcut, command)
--     map('n', shortcut, command)
-- end
--
-- function imap(shortcut, command)
--     map('i', shortcut, command)
-- end
--
-- function vmap(shortcut, command)
--     map('v', shortcut, command)
-- end
--
-- function cmap(shortcut, command)
--     map('c', shortcut, command)
-- end
--
-- function tmap(shortcut, command)
--     map('t', shortcut, command)
-- end
--
-- -- sane regex
-- nmap('/', '/\\v')
-- vmap('/', '/\\v')
--
-- -- disable jump while using * and #
-- nmap('*', '*<c-o>')
-- nmap('#', '#<c-o>')
--
-- -- keep search matches in the middle of the window
-- nmap('n', 'nzzzv')
-- nmap('N', 'Nzzzv')
--
-- -- Open a Quickfix window for the last search.
-- nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")
--
-- -- more natural movement with wrap on
-- nmap('j', 'gj')
-- nmap('k', 'gk')
-- vmap('j', 'gj')
-- vmap('k', 'gk')
--
-- -- Easy buffer navigation
-- nmap('<C-h>', '<C-w>h')
-- nmap('<C-j>', '<C-w>j')
-- nmap('<C-k>', '<C-w>k')
-- nmap('<C-l>', '<C-w>l')
--
-- -- Reselect visual block after indent/outdent
-- vmap('<', '<gv')
--
-- -- Easy window split; C-w v -> vv, C-w - s -> ss
-- -- nmap('vv', '<C-w>v')
-- -- nmap('ss', '<C-w>s')
-- vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
-- vim.o.splitright = true -- when splitting vertically, mnove coursor to right panemap('>', '>gv')
--
-- nmap('<esc>', '<esc>:noh<cr>')
-- imap('<esc>', '<esc>:noh<cr>')
