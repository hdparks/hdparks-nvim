local apm = require('vim-apm');
apm:setup({})
-- always on by default, baby. MY LIFE FOR AUIR
apm:toggle_monitor()

vim.keymap.set("n","<leader>apm", function() apm:toggle_monitor() end)
