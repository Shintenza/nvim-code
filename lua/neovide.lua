local set = vim.opt
if vim.g.neovide then
    set.guifont = 'JetBrainsMono Nerd Font:h9.6' -- fonts for gui frontends

    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)
end
