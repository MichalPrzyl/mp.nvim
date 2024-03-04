local opts = { noremap = true, silent = true }
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

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
keymap.set("n", "er", function()
	vim.diagnostic.disable()
end, opts)

-- Enable diagnostics
keymap.set("n", "eR", function()
	vim.diagnostic.enable()
end, opts)

-- Pasting in nvim doesn't remove value from register.
keymap.set("v", "<leader>p", '"_dP')

-- harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>hs", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():append()
end)

vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
