local M = {
  {
    'scottmckendry/cyberdream.nvim', --"LunarVim/darkplus.nvim",
    lazy = false, -- laod at startup
    priority = 1000, -- loads before the rest of plugins
  },
  { "rebelot/kanagawa.nvim",
    lazy = false, -- laod at startup
    priority = 1000, -- loads before the rest of plugins
  },
}

-- function M.config()
--   -- vim.cmd.colorscheme 'cyberdream'
--   vim.cmd.colorscheme "darkplus"
-- end

return M
