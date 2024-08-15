local M = {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'hrsh7th/cmp-nvim-lsp',
    },
    {
      'hrsh7th/cmp-emoji',
    },
    {
      'hrsh7th/cmp-buffer',
    },
    {
      'hrsh7th/cmp-path',
    },
    -- {
    --   'hrsh7th/cmp-cmdline',
    -- },
    {
      'saadparwaiz1/cmp_luasnip',
    },
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
    },
    {
      'hrsh7th/cmp-nvim-lua',
    },
  },
}

function M.config()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  require('luasnip/loaders/from_vscode').lazy_load()

  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
  vim.api.nvim_set_hl(0, 'CmpItemKindTabnine', { fg = '#CA42F0' })
  vim.api.nvim_set_hl(0, 'CmpItemKindEmoji', { fg = '#FDE030' })

  local check_backspace = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
  end

  local icons = require 'user.icons'

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<C-y>'] = cmp.mapping.confirm { select = true },
    },
    sources = {
      { name = 'luasnip', keyword_length = 3 },
      { name = 'nvim_lsp', keyword_length = 3, max_item_count = 10 },
      { name = 'nvim_lua', keyword_length = 3 },
      { name = 'buffer', keyword_length = 3 },
      { name = 'path', keyword_length = 3 },
      --{ name = 'cmdline', keyword_length = 3 },
      { name = 'calc', keyword_length = 3 },
      { name = 'emoji', keyword_length = 2 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.kind,
      },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
        border = 'rounded',
        scrollbar = false,
      },
      documentation = {
        border = 'rounded',
      },
    },
    experimental = {
      ghost_text = false,
    },
  }
end

return M
