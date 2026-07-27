require("saintrivers")

-- local project_library_path = "~/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/"
local ok, mason_registry = pcall(require, 'mason-registry')
if not ok then
    vim.notify 'mason-registry could not be loaded'
    return
end

local angularls_path =
    mason_registry.get_package('angular-language-server'):get_install_path()

-- local cmd = {
--     "ngserver",
--     "--ngProbeLocations",
--     angularls_path,
--     "--tsProbeLocations",
--     angularls_path ,
--     "--stdio",
-- }

local cmd = {
    'ngserver',
    '--stdio',
    '--tsProbeLocations',
    table.concat({
        angularls_path,
        vim.uv.cwd(),
    }, ','),
    '--ngProbeLocations',
    table.concat({
        angularls_path .. '/node_modules/@angular/language-server',
        vim.uv.cwd(),
    }, ','),
}

-- require'lspconfig'.angularls.setup{
--     cmd = cmd,
--     on_new_config = function(new_config, new_root_dir)
--         new_config.cmd = cmd
--     end
-- }

