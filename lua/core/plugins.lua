-- telescope config
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- set color
vim.cmd("colorscheme kanagawa")

-- enable mason
require("mason").setup()

-- enable aerial to view members in a file
require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- enable tabs for editor
vim.opt.termguicolors = true
require("bufferline").setup({})

-- code block indents
require("ibl").setup()

--
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		-- "gopls",
		--		"rust_analyzer",
		-- "angularls",
		-- "tsserver",
		-- "tailwindcss",
		-- "dockerls",
		-- "docker_compose_language_service",
		"clangd",
	},
})

-- code formatter
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
