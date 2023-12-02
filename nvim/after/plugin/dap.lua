-- dap ui
-- ======
require("dapui").setup(
	{
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "✖",
				pause = "⏸",
				play = "⏵",
				run_last = "⏭",
				step_back = "<-",
				step_into = "->",
				step_out = ">>",
				step_over = "=>",
				terminate = "⏻"
			}
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "▸",
			current_frame = "◉",
			expanded = "▾"
		},
		layouts = { {
			elements = { {
				id = "watches",
				size = 0.5
			}, {
				id = "scopes",
				size = 0.5
			} },
			position = "right",
			size = 40
		}, {
			elements = { {
				id = "repl",
				size = 1
			}},
			position = "bottom",
			size = 10
		} },
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 100
		}
	}
)

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- dap pretty breakpoints
vim.api.nvim_set_hl(0, 'DapBreakpoint', { bg='#5B2222' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg=White, bg='#eae7e7', fg='#5B2222'})

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

-- dap adapters for languages

-- Python
-- ======

local function get_module()
	local packages_path = vim.fn.getcwd() .. '/.venv/lib/python3.10/site-packages'
	if vim.fn.isdirectory(packages_path .. '/uvicorn') == 1 then
		return 'uvicorn'

	elseif vim.fn.isdirectory(packages_path .. '/flask') == 1 then
		return 'flask'

	else
		return ''
	end
end;

dap.adapters.python = {
	type = 'executable';
	command = os.getenv('HOME') ..'/.virtualenvs/debugpy/bin/python';
	args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = 'launch';
		name = "Launch file";

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
		cwd = vim.fn.getcwd();
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
				return cwd .. '/.venv/bin/python'
			else
				return '/usr/bin/python'
			end
		end;
		module = get_module();
		args = function()
			local module = get_module()
			if module == 'uvicorn' then
				return {
					string.format('app:%s',
					os.getenv('APP_INSTANCE_NAME')),
					'--host',
					'0.0.0.0',
					'--port',
					os.getenv('PORT'),
					-- '--reload'
					}
			elseif module == 'flask' then
				return {
					'run',
					'--port',
					os.getenv('PORT'),
					-- '--reload',
				}
			else
				return {}
			end
		end;
	},
}

-- can use this to launch specific debug configs

 table.insert(dap.configurations.python, {
   type = 'python',
   request = 'launch',
   name = 'identity',
   cwd = vim.fn.getcwd(),
   pythonPath ='/home/vibhav-zf/.cache/pypoetry/virtualenvs/identity-services-RJ2hBNHc-py3.10/bin/python',
   module = 'flask',  -- NOTE: Adapt path to manage.py as needed
   args = {
	   'run',
 	  '--port',
	  '8000',
 	  -- '--reload'
   }
 })


--  table.insert(dap.configurations.python, {
--    type = 'python',
--    request = 'launch',
--    name = 'FastAPI',
--    cwd = vim.fn.getcwd(),
--    pythonPath = vim.fn.getcwd() .. '/.venv/bin/python',
--    module = 'uvicorn',  -- NOTE: Adapt path to manage.py as needed
--    args = {
--  	  string.format('app:%s',
--  	  os.getenv('APP_INSTANCE_NAME')),
--  	  '--host',
--  	  '0.0.0.0',
--  	  '--port',
--  	  os.getenv('PORT'),
--  	  -- '--reload'
--    }
--  })

-- Go
-- ==
dap.adapters.go = {
	type = 'server',
	port = '${port}',
	executable = {
		command = os.getenv('HOME') ..'/go/dlv',
		args = { 'dap', '-l', '127.0.0.1:${port}'}
	};
}

dap.configurations.go = {

	{
		-- The first three options are required by nvim-dap
		type = 'go'; -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = 'launch';
		name = "Launch file";
		program = vim.fn.getcwd() .. '/main.go'
	}
}
