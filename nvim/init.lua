-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- go compiler
vim.api.nvim_create_user_command("GoRunQF", function()
	vim.fn.setqflist({}, " ", {
		title = "go run",
		lines = vim.fn.systemlist("go run *.go"),
	})
	vim.cmd("copen")
end, {})

-- go linter
vim.api.nvim_create_user_command("GolintCwd", function()
	local output = vim.fn.systemlist("staticcheck ./...")
	vim.fn.setqflist({}, " ", {
		title = "Golint",
		lines = output,
	})
	vim.cmd("copen")
end, {})

-- User command for Pylint
vim.api.nvim_create_user_command("PylintCwd", function()
	vim.fn.setqflist({}, " ", {
		title = "Pylint",
		lines = vim.fn.systemlist("pylint . --output-format=parseable"),
	})
	vim.cmd("copen")
end, {})

-- 2-space indentation
vim.api.nvim_create_autocmd("FileType", {

	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "go", "python" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.autoindent = true
		vim.bo.smartindent = true
	end,
})

-- Global leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Global indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Better movement in insert and command mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-l>", "<Right>")

-- Russian keyboard langmap
vim.cmd(
	"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
)

-- treesitter doesn't work for js/ts with JSX, so we use prettier
return {
	{
		"stevearc/conform.nvim",
		lazy = false, -- Or set to true with 'event = { "BufWritePre" }' if you want format-on-save only
		keys = {
			{
				"=",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format (conform)",
			},
			-- You might also want to map 'gq' to format for consistency with Vim's default
			-- { 'gq', function() require('conform').format({ async = true, lsp_fallback = true }) end, mode = {'n', 'v'}, desc = "Format (conform)" },
		},
		opts = {
			-- Options for conform.nvim
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				-- Add other file types you want Prettier to handle
			},
			-- Optional: format on save
			format_on_save = {
				-- These options will be passed to conform.format() when auto-formatting
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
