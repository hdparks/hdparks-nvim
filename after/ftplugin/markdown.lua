vim.o.tabstop = 4;
vim.o.shiftwidth = 4;
vim.o.conceallevel = 1;

-- mark checkbox
vim.keymap.set("n","<leader>d", function() vim.cmd("ObsidianToggleCheckbox") end, {silent=true} )

---@param startHour integer
---@param startMinute integer
---@param endHour integer
---@param endMinute integer
local function formatPom(startHour, startMinute, endHour, endMinute)
	return string.format("- %d:%02d - %d:%02d", startHour, startMinute, endHour, endMinute)
end

-- insert pompom line
local function insertPom()
	local x = os.time()
	local hour = tonumber(os.date("%I", x)) + 0
	local minute = math.floor(tonumber(os.date("%M", x)) / 5) * 5 + 5

	if minute >= 60 then
		hour = hour + 1
		minute = minute - 60
	end

	if hour == 13 then
		hour = 1
	end

	-- add 25
	local endHour = hour
	local endMinute = minute + 25
	if endMinute >= 60 then
		endHour = endHour + 1
		endMinute = endMinute - 60
	end
	if endHour == 13 then
		endHour = 1
	end

	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0,row-1,col, row-1,col, {formatPom(hour, minute, endHour, endMinute)})
end

vim.keymap.set("n","<leader>ts", insertPom)

-- edit pompom line

---@param minutes integer
local function shiftPom(minutes)
	local line = vim.api.nvim_get_current_line()
	local _,_,startHour,startMinute,endHour,endMinute = string.find(line,"%- (%d+):(%d%d) %- (%d+):(%d%d)")

	startHour = tonumber(startHour)
	startMinute = tonumber(startMinute)
	endHour = tonumber(endHour)
	endMinute = tonumber(endMinute)

	startMinute = startMinute + minutes
	endMinute = endMinute + minutes

	if startMinute >= 60 then
		startMinute = startMinute - 60
		startHour = startHour + 1
	end
	if startMinute < 0 then
		startMinute = startMinute + 60
		startHour = startHour - 1
	end
	if startHour == 13 then startHour = 1 end
	if startHour <= 0 then startHour = startHour + 12 end

	if endMinute >= 60 then
		endMinute = endMinute - 60
		endHour = endHour + 1
	end
	if endMinute < 0 then
		endMinute = endMinute + 60
		endHour = endHour - 1
	end
	if endHour >= 13 then endHour = endHour - 12 end
	if endHour <= 0 then endHour = endHour + 12 end

	vim.api.nvim_set_current_line(formatPom(startHour, startMinute, endHour, endMinute))
end

vim.keymap.set("n","<leader>tl",function() shiftPom(5) end)
vim.keymap.set("n","<leader>th",function() shiftPom(-5) end)
