-- Setup cmp
local status, npairs = pcall(require, "nvim-autopairs")
if not status then
    return
end

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "specter_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'", "<" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopasdfghjklzxcvbnm",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
