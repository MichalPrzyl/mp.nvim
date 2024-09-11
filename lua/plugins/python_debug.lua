return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			require("dap").set_log_level("DEBUG")

			dap.adapters.python = {
				type = "executable",
				command = "/home/michal/Projects/django-nvim-debugger/venv/bin/python",
				args = { "-m", "debugpy.adapter" },
			}

      -- If debugging django proj:
      --  - change 'program' attribute comment
      --  - comment 'args', 'django' attributes
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch Django Server",
          -- If debugging normal files, not django project, just change comments
          -- on program attribute value
					program = "/home/michal/Projects/django-nvim-debugger/backend/manage.py", -- used with django proj
          -- program = "${file}", -- used with files
					args = { "runserver", "--noreload", "0.0.0.0:8000" }, -- Parametry do uruchomienia serwera Django
					django = true, -- Włączenie trybu Django
					pythonPath = function()
				        return "/home/michal/Projects/django-nvim-debugger/venv/bin/python"
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
