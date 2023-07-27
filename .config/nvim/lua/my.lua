-- T es una variable global, por lo cual
-- puedo llamarma de cualquier lado.
my_shit = {}
 
function my_shit.pete()
print( "(☞⌐▀͡ ͜ʖ͡▀ )☞  -- YO-MAMA")
end

function my_shit.see_the_fucking_comments(color)
  if color == nil then
   color = "#888888" 
  end
  vim.cmd.highlight({ "Comment", "guifg=" .. color})
end


return my_shit
