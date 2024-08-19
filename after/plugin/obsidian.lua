local workspace_paths = vim.split(vim.fn.glob("~/Obsidian/*"),"\n")
local workspaces = {}
for _, path in ipairs(workspace_paths) do
	table.insert(workspaces,{path=path})
end

require("obsidian").setup({
	workspaces=workspaces,
	daily_notes={
		folder="Daily Notes",
		date_format="%Y/%b/%d (%a)"
	},
	ui={
		checkboxes={
			[" "] = { char = "󰄱", order=1, hl_group = "ObsidianTodo" },
			["x"] = { char = "", order=2, hl_group = "ObsidianDone" },
		}
	}
})
