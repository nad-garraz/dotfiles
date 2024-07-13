local M = {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}

function M.config()
  local null_ls = require 'null-ls'
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      formatting.clang_format.with {
        command = '/usr/bin/clang-format',
        extra_args = {
          '--style={'
            .. 'AlignConsecutiveAssignments: {Enabled: true, AlignCompound: true, AcrossEmptyLines: false, AcrossComments: false}, '
            .. 'AlignConsecutiveDeclarations: {Enabled: true, AcrossEmptyLines: false, AcrossComments: false}, '
            .. 'AllowShortCaseLabelsOnASingleLine: true, '
            .. 'AllowShortFunctionsOnASingleLine: true, '
            .. 'AllowShortIfStatementsOnASingleLine: Always, '
            .. 'BraceWrapping: {SplitEmptyFunction: false}, '
            .. 'BreakBeforeBraces: Allman, '
            .. 'BreakBeforeTernaryOperators: true, '
            .. 'BreakConstructorInitializers: BeforeComma, '
            .. 'ColumnLimit: 130, '
            .. 'IndentCaseLabels: false, '
            .. 'IndentWidth: 2, '
            .. 'PackConstructorInitializers: Never, '
            .. 'ReflowComments: false, '
            .. 'UseTab: Never'
            .. '}',
        },
      },
      null_ls.builtins.completion.spell,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- PARA ENCONTRAR PARAMETROS --> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
    },
  }
end

return M
