-- set the leader key
vim.g.mapleader = " "

-- remap copy to clipboard > needs xclip (for x11)
vim.keymap.set("v", "<leader>y", '"+y')

-- open netrw on the side
vim.keymap.set("n", "<leader>e", vim.cmd.Vex)

-- fzf remaps
vim.keymap.set("n", "<leader>f", ":Rg<CR>") -- fuzzy search
vim.keymap.set("n", "<leader>p", ":GFiles<CR>") -- git file search
vim.keymap.set("n", "<leader>P", ":Files<CR>") -- file search


-- insert mode jump to start/end of line
vim.keymap.set("i", "<C-h>", "<C-o>^")
vim.keymap.set("i", "<C-l>", "<C-o>$")

-- preserve the copy buffer (when you y and virtualmode paste) 
vim.keymap.set("x", "<leader>p", "\"_dP")

-- bulk rename in buffer
vim.keymap.set("n", "<s-f6>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- splits QoL
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +3<CR>")
vim.keymap.set("n", "<C-Up>", ":resize -3<CR>")

-- moving from one window to another
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-j>", "<C-W>j")


-- dap remaps
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")

-- dapui remaps
vim.keymap.set("n", "<leader>d", ":lua require('dapui').toggle()<CR>")
