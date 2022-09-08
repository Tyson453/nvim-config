local fn = vim.fn

-- Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use protected call so we don't error out
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

--  Make packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- Colorschemes
    use "tanvirtin/monokai.nvim"
    use "phanviet/vim-monokai-pro"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- Completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp snippets

    -- snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- snippets

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server isntaller
    use "jose-elias-alvarez/null-ls.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "BurntSushi/ripgrep" -- Needed for Telescope live_grep

    -- TreeSitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- Comments
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "numToStr/Comment.nvim"

    -- Gitsigns
    use "lewis6991/Gitsigns.nvim"

    -- nvim-tree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    -- bufferline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- lualine
    use "nvim-lualine/lualine.nvim"

    -- Automatically setup your config after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
