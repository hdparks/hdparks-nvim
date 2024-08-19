vim.o.tabstop = 2;
vim.o.shiftwidth = 2;
vim.o.expandtab = true;

local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
if #lines == 1 and #lines[1] == 0 then
	vim.api.nvim_buf_set_lines(0, 0, 0, false, {
		"<template>",
		"\t<div>",
		"\t</div>",
		"</template>",
		'<script setup lang="ts">',
		"</script>"
	})
end
