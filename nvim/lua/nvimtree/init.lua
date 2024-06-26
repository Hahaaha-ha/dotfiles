-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local opt = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<cr>", opt)
vim.keymap.set("n", "<Leader>E", ":NvimTreeFocus<cr>", opt)
vim.keymap.set("n", "<Leader>d", ":NvimTreeFindFile<cr>", opt)

-- vim.keymap.set("n", "<Ctrl>j", ":NvimTreeResize +5<cr>", opt)

-- vim.keymap.set("n", "<Ctr>-", ":NvimTreeResize -5<cr>", opt)

-- OR setup with some options

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"


    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = false, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)


    -- custom mappings
    -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    -- vim.keymap.set('n', '<leader>a', api.tree.tree.open(),                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },

    -- on_attach = my_on_attach,
}
