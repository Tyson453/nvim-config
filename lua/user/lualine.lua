local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn' },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = true,
    always_visible = true,
}

local diff = {
    'diff',
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_in_width,
}

local mode = {
    'mode',
    fmt = function(str)
        return '-- ' .. str .. ' --'
    end,
}

local filetype = {
    'filetype',
    icons_enabled = true,
    icon = nil
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = "",
}

local filename = { 'filename' }
local location = { 'location' }
local encoding = { 'encoding' }
local fileformat = { 'fileformat' }

local progress = function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local spaces = function()
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            'dashboard', 'NvimTre', 'Outline'
        },
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff, diagnostics },
        lualine_c = { filename },
        lualine_x = { encoding, fileformat, filetype },
        lualine_y = { progress },
        lualine_z = { location },
    }
}
