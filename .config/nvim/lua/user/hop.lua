 -- Setup hop
local status_ok, npairs = pcall(require, "hop")
if not status_ok then
  return
end

-- Use better keys for the bépo keyboard layout and set
-- a balanced distribution of terminal / sequence keys
npairs.setup { keys = 'etovxqpdygfblzhckisuran', jump_on_sole_occurrence = false }



