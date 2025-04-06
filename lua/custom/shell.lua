-- vim.o.shell = "powershell" -- Simple approach, might not work in all scenarios
-- More robust approach, specifying the executable path
vim.o.shell = 'powershell' -- Or 'pwsh', try both
vim.o.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command'
vim.o.shellredir = '> %s 2>&1'
vim.o.shellpipe = '| tee %s'
vim.o.shellquote = '"'
vim.o.shellxquote = ''
