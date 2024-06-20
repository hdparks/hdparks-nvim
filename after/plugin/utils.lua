-- not part of any actual plugin, just some fun stuff


-- Generate a random float value under the cursor
vim.api.nvim_create_user_command(
	"RandF",
	function(opts)
		local lower = opts.fargs[1] or 0
		local upper = opts.fargs[2] or 1
		local digits = opts.fargs[3] or 2

		local floatFormat = digits and "%."..digits.."f" or "%.f"
		local r = math.random()
		local fr = r * (upper - lower) + lower
		local output = string.format(floatFormat, fr)

		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_buf_set_text(0,row-1,col,row-1,col,{ output })
	end,
	{
		nargs="*"
	})
