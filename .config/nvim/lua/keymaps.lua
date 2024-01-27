local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Set leader to space
vim.g.mapleader = " "


-- Buffer navigation
map("n", "<S-l>", "<Plug>(cokeline-focus-next)", opts)
map("n", "<S-h>", "<Plug>(cokeline-focus-prev)", opts)
map("n", "<leader>q", ":bd<CR>", opts)

-- Move text
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-1<CR>==gi", opts)

-- Telescope
map("n", "ff", ":Telescope find_files<CR>", opts)
map("n", "fg", ":Telescope live_grep<CR>", opts)
map("n", "fb", ":Telescope buffers<CR>", opts)

-- Easier window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>w", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- NvimTree
map("n", "ft", ":NvimTreeToggle<CR>", opts)

-- ChatGPT
map("n", "cc", ":ChatGPT<CR>", opts)

-- FloaTerm
--map("n", "<F12>", ":FloatermToggle!<CR>", opts)
--map("n", "ft", ":ToggleTerm<CR>", opts)
