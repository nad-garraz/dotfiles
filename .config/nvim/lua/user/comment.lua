local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
   ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = false,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },

  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
