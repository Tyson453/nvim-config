local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers
-- Alternatively, you may also register handlers on specific server instances instead
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attack = require("user.lsp.handlers").on_attack,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "pyright" then
        local pyright_opts = require("user.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    server:setup(opts)
end)
