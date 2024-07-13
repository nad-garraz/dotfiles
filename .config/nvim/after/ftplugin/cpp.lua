-- Function to run 'make clean run'
local function make_clean_run()
  vim.cmd.write { bang = true } -- Save all buffers silently
  vim.cmd '6TermExec cmd="make clean run"'
end

-- Function to compile with g++
local function compile_cpp()
  vim.cmd.write() -- Save all buffers
  local compile_command = 'g++ -std=c++17 -Wunused-variable -pedantic -Wall *cpp *h -o %:r.out -g'
  vim.cmd('5TermExec cmd="' .. compile_command .. '"')
end

-- Set up keymaps
vim.keymap.set('n', '<leader>cc', make_clean_run, {
  buffer = true,
  desc = "Run 'make clean run'",
})

vim.keymap.set('n', '<leader>mc', compile_cpp, {
  buffer = true,
  desc = 'Compile C++ files',
})
