local lspsaga_ok, lspsaga = pcall(require, "lspsaga")

if not lspsaga_ok then
    return
end

lspsaga.init_lsp_saga({
    border_style = "single", -- "single" | "double" | "rounded" | "bold" | "plus"
    saga_winblend = 0, -- transparency
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    code_action_icon = "💡", -- use emoji lightbulb in default
    code_action_num_shortcut = true, -- if true can press number to execute the codeaction in codeaction window
    code_action_lightbulb = { -- same as nvim-lightbulb but async
        enable = false,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = 'right',
        -- set the special filetype in there which in left like nvimtree neotree defx
        left_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
})
