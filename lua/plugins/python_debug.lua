return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.python = {
				type = "executable",
				command = "/home/michal/Projects/django-nvim-debugger/venv/bin/python3.12",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch Program",
					program = "${file}", -- python file to debug
					pythonPath = function()
						return "/home/michal/Projects/django-nvim-debugger/venv/bin/python3.12"
					end,
				},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" }, -- upewnij się, że jest zależność od 'nvim-dap'
		config = function()
			-- Inicjalizacja nvim-dap-ui
			require("dapui").setup()

			-- Automatyczne otwieranie i zamykanie UI podczas debugowania
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

			-- Inicjalizacja nvim-dap-virtual-text
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" }, -- upewnij się, że jest zależność od 'nvim-dap'
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
