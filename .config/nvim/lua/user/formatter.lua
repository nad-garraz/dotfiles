local M = {
        "mhartington/formatter.nvim",
}


function M.config()
-- Utilities for creating configurations
local util = require("formatter.util")
require "formatter".setup({
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
			function()
				return {
					exe = "/home/nad/.local/share/nvim/mason/bin/black",
					args = {
						"--line-length 120",
					},
				}
			end,
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
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		haskell = { -- Los formatters no tiene que ser necesariamente los que están en la página del formatter
			function()
				return {
					exe = "/home/nad/.local/share/nvim/mason/bin/fourmolu",
					args = {
						"--mode inplace",
						"--indentation=4",
						"--let-style=newline",
						"--in-style=left-align",
						"--comma-style=trailing",
						"--column-limit=150",
						"--indent-wheres=true",
						"--import-export-style=diff-friendly",
					},
				}
			end,
		},
		cpp = { -- PARA ENCONTRAR PARAMETROS --> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
			require("formatter.filetypes.cpp").clangformat,
			function()
				local multiLinesStyle = [[ --style="{
                                      AlignConsecutiveAssignments: {Enabled: true, AlignCompound: true, AcrossEmptyLines: false, AcrossComments: false},
                                      AlignConsecutiveDeclarations: {Enabled: true, AcrossEmptyLines: false, AcrossComments: false},
                                      AllowShortCaseLabelsOnASingleLine: true,
                                      AllowShortFunctionsOnASingleLine: true,
                                      AllowShortIfStatementsOnASingleLine: Always,
                                      BraceWrapping: {SplitEmptyFunction: false},
                                      BreakBeforeBraces: Allman,
                                      BreakBeforeTernaryOperators: true,
                                      BreakConstructorInitializers: BeforeComma,
                                      ColumnLimit: 130,
                                      IndentCaseLabels: false,
                                      IndentWidth: 2,
                                      PackConstructorInitializers: Never,
                                      ReflowComments: false, 
                                      UseTab: Never,
                                      }"
                                ]]
				return {
					exe = "/home/nad/.local/share/nvim/mason/packages/clang-format/venv/bin/clang-format",
					args = {
						multiLinesStyle,
						-- util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
	},
	-- Use the special "*" filetype for defining formatter configurations on
	-- any filetype
	["*"] = {
		-- "formatter.filetypes.any" defines default configurations for any filetype
		require("formatter.filetypes.any").remove_trailing_whitespace,
}
})

end

return M
