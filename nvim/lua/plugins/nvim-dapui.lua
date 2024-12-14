return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      silent = true,
    },
  },
  opts = {
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    layouts = {
      {
        elements = {
          { id = "repl", size = 0.30 },
          { id = "console", size = 0.70 },
        },
        size = 0.19,
        position = "bottom",
      },
      {
        elements = {
          { id = "scopes", size = 0.30 },
          { id = "breakpoints", size = 0.20 },
          { id = "stacks", size = 0.10 },
          { id = "watches", size = 0.30 },
        },
        size = 0.20,
        position = "right",
      },
    },
    floating = {
      max_height = 0.9,
      max_width = 0.5,
      border = vim.g.border_chars,
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
  },
  config = function(_, opts)
    require("dapui").setup(opts)
  end,
}
