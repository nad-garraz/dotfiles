local status_formatter_ok, formatter = pcall(require, "formatter")
if not status_formatter_ok then
	return
end

-- Utilities for creating configurations
local util = require("formatter.util")
formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		-- LUA
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						"--single-quote",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						"--single-quote",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
    json = {
			require("formatter.filetypes.json").prettier,
    },
		python = {
			require("formatter.filetypes.python").black,
		},

		tex = {
			require("formatter.filetypes.latex").latexindent,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},
	},
	-- Use the special "*" filetype for defining formatter configurations on
	-- any filetype
	["*"] = {
		-- "formatter.filetypes.any" defines default configurations for any filetype
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
})
