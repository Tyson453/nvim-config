local options = {
    cmdheight = 2,
    termguicolors = true,
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showmode = false,
    showtabline = 4,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeoutlen = 1000,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 2,
    signcolumn = "yes",
    wrap = true,
    scrolloff = 8,
    sidescrolloff = 8,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
