vim.o.tabstop = 4;
vim.o.shiftwidth = 4;
vim.cmd('set expandtab');

local augroup = vim.api.nvim_create_augroup("CSharpFormatting", {})
vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    callback = function()
        -- os.execute("dotnet format --include "..vim.api.nvim_buf_get_name(0))
    end,
})


