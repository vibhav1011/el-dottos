-- custom statusline
vim.o.laststatus = 2

function set_git_branch()
	local branch_name = vim.call('gitbranch#name')
	if(branch_name == '') then
		return 'file:'
	else 
		return  " :"
	end
end
local git_branch = set_git_branch()

vim.o.statusline = ""
		.. "%#PmenuSel#"
		.. string.format("%s", git_branch)
		.. "%{gitbranch#name()}"
		.. "%#WarningMsg#"
		.. " %f "
		.. "%m"
		.. "%="
		.. "%#CursorColumn#"
		.. "%y "
		.. "| %l:%c "
