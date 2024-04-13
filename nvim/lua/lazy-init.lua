local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " "       -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim",     cmd = "Neoconf" },
    "folke/neodev.nvim",
    { "nvim-tree/nvim-tree.lua" },
    -- "nvim-tree/nvim-web-devicons",
    { "RRethy/nvim-base16",     lazy = true, },
    {
        cmd = "Telescope",
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>p",  ":Telescope find_files<CR>", desc = "find files" },
            { "<leader>P",  ":Telescope live_grep<CR>",  desc = "grep file" },
            { "<leader>rs", ":Telescope resume<CR>",     desc = "resume" },
            { "<leader>q",  ":Telescope oldfiles<CR>",   desc = "find oldfiles" },
        },
    },
    {
        event = "VeryLazy",
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    },
    {
        event = "VeryLazy",
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
    },
    	{
		event = "VeryLazy",
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
		},
	},
    {
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
})


-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
