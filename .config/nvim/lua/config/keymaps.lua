local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- delete with x and don't copy
map("n", "x", '"_x')

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
map("n", "<Leader>w", ":update<Return>", opts)
map("n", "<Leader>q", ":quit<Return>", opts)
map("n", "<Leader>Q", ":qa<Return>", opts)

-- Tabs
map("n", "te", ":tabedit")
map("n", "<tab>", ":tabnext<Return>", opts)
map("n", "<s-tab>", ":tabprev<Return>", opts)
map("n", "tw", ":tabclose<Return>", opts)

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Resize window
map("n", "<C-S-h>", "<C-w><")
map("n", "<C-S-l>", "<C-w>>")
map("n", "<C-S-k>", "<C-w>+")
map("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
map("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Move selected blocks
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- paste over text and don't input in registery
map("x", "<leader>p", [["_dP]])

-- delete text and don't copy
map({ "n", "v" }, "<leader>d", [["_d]])

-- copy to clipboard and registery
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
vim.api.nvim_set_keymap("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
