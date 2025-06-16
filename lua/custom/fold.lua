vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.MyFoldExpr()'

function MyFoldExpr()
  local line = vim.fn.getline(vim.v.lnum)
  if line:find('//println', 1, true) then -- `true` makes it a plain search (not a Lua pattern)
    return '1' -- Fold this line
  else
    return '0' -- No folding
  end
end
