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
keymap.set("n", "<leader>sv", "<C-w>v<C-w>l", { desc = "Split window vertically" }) -- split window vertically
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
vim.keymap.set("n", "<leader>pr", "oprint(f\"\")<ESC>hhpa: {}<ESC>h\"0p")

-- replace
vim.keymap.set("n", "<leader>vp", "viwpyiw")

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
vim.keymap.set("n", "<C-c>", "\"+yiw")
vim.keymap.set("v", "<C-c>", "\"+y")

-- recent files
vim.keymap.set("n", "<leader>rec", "<CMD>lua require('telescope').extensions.recent_files.pick()<CR>")

-- Toggle auto surround
-- TODO: Get this done already...
-- References:
-- https://neovim.discourse.group/t/how-to-disable-builtin-plugins/787

-- ready for surround toggle but I have no idea how to do this
vim.keymap.set("n", "<leader>sur", "")

-- Run python script
vim.keymap.set("n", "<C-C><C-P>", ":w | !python3 '%:p'<CR>")
vim.keymap.set("i", "<C-C><C-P>", "<ESC>:w | !python3 '%:p'<CR>")


-- Run bash script
vim.keymap.set("n", "<C-C><C-B>", ":w | !/bin/bash '%:p'<CR>")
vim.keymap.set("i", "<C-C><C-B>", "<ESC>:w | !/bin/bash '%:p'<CR>")

-- Document symbols
vim.keymap.set("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>")

-- Workdir symbols
vim.keymap.set("n", "<leader>ws", ":Telescope lsp_workspace_symbols query=")
vim.keymap.set("n", "<leader>dws", ":Telescope lsp_dynamic_workspace_symbols<CR>")

-- Center after back from definition
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Center after going to end of file
vim.keymap.set("n", "G", "Gzz")

-- Open definition in split view
vim.keymap.set("n", "<leader>gd", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.lsp.buf.definition()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 100) -- opóźnienie w milisekundach
end, { noremap = true, silent = true })

-- Select whote line from start to end
vim.keymap.set("n", "<leader>ss", "^v$h")

-- Move whole lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Open Explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", {})

-- Split with Explorer
vim.keymap.set("n", "<leader>ve", ":Ve<CR><C-w>x<C-W>l", {})

-- Split horizontally with Explorer
vim.keymap.set("n", "<leader>vs", ":Se<CR><C-w>x<C-W>j", {})

-- Git blame toogle
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", {})

-- navigating with ctrl + l/j/l/h
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})

-- change tabs quicker
keymap.set("n", "L", "<cmd>tabn<CR>", { desc = "Go to next tab", noremap = true}) --  go to next tab
keymap.set("n", "H", "<cmd>tabp<CR>", { desc = "Go to previous tab", noremap = true }) --  go to previous tab

-- remove whitespaces at the end of the lines
keymap.set("v", "<leader>rw", ":s/\\s\\+$//<CR>", { desc = "Remove whitespaces at the end of the line", noremap = true })

-- set cc=80
keymap.set("n", "<leader>cc", ":set cc=80 <CR>", { desc = "Set cc=80", noremap = true })

-- remove whitespaces at the end of the lines
keymap.set("v", "<leader>rw", ":s/\\s\\+$//<CR>", { desc = "Remove whitespaces at the end of the line", noremap = true })

-- HopWord
keymap.set("n", "s", ":HopWord<CR>", { desc = "HopWord Toggle", noremap = true })

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", {noremap = true, silent = true})

-- debugging python
-- set breakpoint
vim.api.nvim_set_keymap('n', '<F9>', ":lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", {noremap = true, silent = true})

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- Telescope buffers
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")

-- noh
keymap.set("n", "<leader>nh", ":noh<CR>", { desc = "No search highlight" })
