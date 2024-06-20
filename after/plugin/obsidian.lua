local workspace_paths = vim.split(vim.fn.glob("~/Obsidian/*"),"\n")
local workspaces = {}
for _, path in ipairs(workspace_paths) do
	table.insert(workspaces,{path=path})
end

require("obsidian").setup({
	workspaces=workspaces
})
