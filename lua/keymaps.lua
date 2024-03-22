local opts = { noremap = true, silent = true }
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- when wrap is on, jump just one line up/down
keymap.set("n", "j", "gj", { desc = "Jump one line down" })
keymap.set("n", "k", "gk", { desc = "Jump one line up" })

-- clear search highlights
keymap.set("n", "<leader>hld", ":set nohlsearch<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>hle", ":set hlsearch<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>te", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "gn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "gp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Don't leave visual mode after indenting with < or >
keymap.set("v", ">", ">gv", { desc = "Don't leave Visual mode after indent" }) --  Don't leave Visual mode after indent
keymap.set("v", "<", "<gv", { desc = "Don't leave Visual mode after indent" }) --  Don't leave Visual mode after indent

-- Terminal inside nvim
keymap.set("n", "<leader>cmd", "<cmd>terminal<CR>", { desc = "Open terminal in nvim" })
-- When you're in terminal inside nvim, remember you can go outside terminal using
-- Ctrl+\ Ctrl+n. Then you can for example copy something from terminal output!!! Mind-blowing!

-- Close buffer
-- keymap.set("n", "<C-Ww>", ":quit<CR>", { desc = "Close" }) -- this is not correct. I am not sure what keybind I want

-- Save buffer
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" })

-- Diagnostics

-- Disable diagnostics
keymap.set("n", "<leader>dd", function()
	vim.diagnostic.disable()
end, opts)

-- Enable diagnostics
keymap.set("n", "<leader>de", function()
	vim.diagnostic.enable()
end, opts)

-- Pasting in nvim doesn't remove value from register.
keymap.set("v", "<leader>p", '"_dP')

-- harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)

vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- python autoprint
vim.keymap.set("n", "<leader>print", "iprint(\"\")<ESC>hhpa: {}<ESC>h\"0p")

-- replace
vim.keymap.set("n", "<leader>vp", "viwp")

-- compile python
vim.keymap.set("n", "<leader>pyt", "<CMD>ToggleTerm<CR>python3 mp_test.py<CR>")

-- automatic sarch under cursor
local telescope_builtin = require("telescope.builtin")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>seh", "yiw/<C-r>\"<CR>N")
vim.keymap.set("n", "<leader>seg", live_grep_args_shortcuts.grep_word_under_cursor)

-- same but in Visual Mode
vim.keymap.set("v", "<leader>seh", "y/<C-r>\"<CR>N")
vim.keymap.set("v", "<leader>seg", live_grep_args_shortcuts.grep_visual_selection)

-- copy to system clipboard
keymap.set("n", "<C-c>", "\"+yiw")
keymap.set("v", "<C-c>", "\"+y")

