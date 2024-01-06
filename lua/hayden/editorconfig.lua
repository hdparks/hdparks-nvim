vim.wo.number = true;
vim.wo.relativenumber = true;
vim.opt.ignorecase = true;
vim.opt.smartcase = true;

-- add some nice shortcuts to show current file in Finder
vim.keymap.set("n", "<leader>pf", ":!open -a Finder %:p:h <enter>")
