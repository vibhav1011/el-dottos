-- get python venv path
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')
local path = util.path

local function get_python_path(workspace)
	-- Use activated virtualenv.
	-- local cwd = vim.fn.getcwd()
	-- if vim.fn.isdirectory(cwd..'/.venv') then
	-- 	return cwd..'/.venv/bin/python'
	-- end
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
	end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end


require("lspconfig").pyright.setup{
	before_init = function(_, config)
		config.settings.python.pythonPath = get_python_path(config.root_dir)
	end,
	capabilities = capabilities,
	filetypes = {"python"},
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
		vim.keymap.set("n", "gD", ":tab split | lua vim.lsp.buf.definition()<CR>", {buffer=0})
		vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition({ reuse_win = true})<CR>", {buffer=0})
		vim.keymap.set("n", "<leader>l", ":lua vim.diagnostic.open_float()<CR>", {buffer=0})
	end,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
				autoImportCompletions = false,
				diagnosticSeverityOverrides = {
					reportOptionalSubscript = "warning",
					reportOptionalMemberAccess = "warning",
					reportOptionalCall = "warning",
					reportOptionalIterable = "warning",
					reportMissingSuperCall = "warning",
					reportUninitializedInstanceVariable = "warning",
					reportUnnecessaryComparison = "warning",
					strictParameterNoneValue = false,
					reportGeneralTypeIssues = false
				}
			}
		}
	}
}


-- js lsp setup
require('lspconfig').tsserver.setup{
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
	on_attach = function()
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
		vim.cmd("colorscheme one_monokai")
		vim.keymap.set("n", "gd", ":tab split | lua vim.lsp.buf.definition()<CR>", {buffer=0})
		vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {buffer=0})
	end,
	cmd = {"typescript-language-server", "--stdio", "--tsserver-path", "/home/vibhav-zf/.nvm/versions/node/v14.17.1/bin/tsc"},
	init_options = {
		preferences = {
			hostInfo = "neovim",
			includeCompletionsForModuleExports = false
		}
	},
}


-- go lsp server
require'lspconfig'.gopls.setup{
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
		vim.keymap.set("n", "gD", ":tab split | lua vim.lsp.buf.definition()<CR>", {buffer=0})
		vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {buffer=0})
		vim.keymap.set("n", "<leader>l", ":lua vim.diagnostic.open_float()<CR>", {buffer=0})
	end,
}
