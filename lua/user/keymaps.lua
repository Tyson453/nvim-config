local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Change nav keys
keymap("n", "j", "h", opts)
keymap("n", "k", "j", opts)
keymap("n", "l", "k", opts)
keymap("n", ";", "l", opts)

keymap("v", "j", "h", opts)
keymap("v", "k", "j", opts)
keymap("v", "l", "k", opts)
keymap("v", ";", "l", opts)

-- NORMAL --
-- Git
keymap("n", "<leader>gc", ':!git commit -m ""', opts)
keymap("n", "<leader>ga", ":!git add %<cr>", opts)
keymap("n", "<leader>gr", ":!git reset %<cr>", opts)
keymap("n", "<leader>gR", ":!git reset<cr>", opts)
keymap("n", "<leader>gu", ":!git reset --hard<cr>", opts)

keymap("n", "<leader>gs", ":!git status<cr>", opts)
keymap("n", "<leader>gd", ":!git diff<cr>", opts)
keymap("n", "<leader>gl", ":!git log<cr>", opts)

keymap("n", "<leader>gb", ":!git branch<cr>", opts)
keymap("n", "<leader>gh", ":!git checkout ", opts)

keymap("n", "<leader>gp", ":!git pull<cr>", opts)
keymap("n", "<leader>gP", ":!git push<cr>", opts)
keymap("n", "<leader>gf", ":!git fetch<cr>", opts)


-- LSP keymaps
keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gl", ":lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>", opts)

-- Bufferline navigation
keymap("n", "<C-n>", ":BufferLineCycleNext<cr>", opts)
keymap("n", "<C-m>", ":BufferLineCyclePrev<cr>", opts)

-- Gitsigns navigation
keymap("n", "<leader>n", ":Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>m", ":Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>b", ":Gitsigns blame_line<cr>", opts)

-- Better window navigation
keymap("n", "<leader>j", "<C-w>h", opts)
keymap("n", "<leader>k", "<C-w>j", opts)
keymap("n", "<leader>l", "<C-w>k", opts)
keymap("n", "<leader>;", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrow keys
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-j>", ":bnext<cr>", opts)
keymap("n", "<S-;>", ":bprevious<cr>", opts)

-- Ease of life
keymap("n", "h", ":noh<cr>", opts)
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("n", "<C-q>", ":q!<cr>", opts)
keymap("n", "<leader>q", ":Bdelete<cr>", opts)
keymap("n", "<leader>o", "o<ESC>", opts)
keymap("n", "<leader>O", "O<ESC>", opts)
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<cr>", opts)

-- INSERT --
-- Press jk quickly to enter normal mode
keymap("i", "jk", "<ESC>", opts)


-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-k>", ":m .+1<cr>==", opts)
keymap("v", "<A-l>", ":m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)


-- VISUAL BLOCK --
-- Move text up and down
keymap("x", "K", ":move '>+1<CR>gv-gv", opts)
keymap("x", "L", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-l>", ":move '<-2<CR>gv-gv", opts)


-- TERMINAL --
-- Better terminal navigation
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<C-;>", "<C-\\><C-N><C-w>;", term_opts)
