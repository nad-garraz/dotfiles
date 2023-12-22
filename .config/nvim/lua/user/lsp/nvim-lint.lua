require('lint').linters_by_ft = {
  markdown = {'vale',},
  lua = {'stylua'},
  javascriptreact = {'quick-lint-js', 'tsserver'},
  javascript = {'quick-lint-js', 'tsserver'},
  json = {'jsonlint'},
  rust = {'ast-grep','rust_analyzer'}
}
