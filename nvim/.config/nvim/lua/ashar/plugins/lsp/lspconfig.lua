local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    vim.notify("Failed to import lspconfig", "error")
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    vim.notify("Failed to import cmp_nvim_lsp", "error")
    return
end

local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
    vim.notify("Failed to import rust-tools", "error")
    return
end

local function on_attach(client, bufnr)
    vim.notify("Attached langauge server")
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Mappings.
    -- vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<leader>gS', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<leader>gR', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_prev, bufopts)
    -- vim.keymap.set('n', '<leader>N', vim.diagnostic.goto_next, bufopts)
    -- vim.keymap.set('n', '<leader>af', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>gD', "<cmd>Lspsaga peek_definition<CR>", bufopts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>gS', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>gr', "<cmd>Lspsaga rename<CR>", bufopts)
    vim.keymap.set('n', '<leader>gR', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>n', "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    vim.keymap.set('n', '<leader>N', "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
    vim.keymap.set('n', '<leader>af', "<cmd>Lspsaga code_action<CR>", bufopts)
    vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", bufopts)

    --vim.keymap.set('n', '<leader>q', vim.lsp.diagnostic.set_loclist)
    --vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics)
    --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
    --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)

    -- Set some keybinds conditional on server capabilities
    local function format_code()
        vim.lsp.buf.format()
        vim.notify("Formatting completed")
    end

    if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<leader>=", format_code, bufopts)
    end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = require("ashar.plugins.lsp.servers")

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end


require 'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
}

local rustopts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = false,
        on_initialized = function(_)
            vim.notify("Rust analyzer: Workspace initialised")
        end,
        inlay_hints = {
            parameter_hints_prefix = " ← ",
            other_hints_prefix = " → ",
        }
    },

    server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

rust_tools.setup(rustopts)

vim.diagnostic.config({
  virtual_text = {
   source = "always",  -- Or "if_many"
   prefix = '●'
  },
  float = {
   source = "always",  -- Or "if_many"
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

