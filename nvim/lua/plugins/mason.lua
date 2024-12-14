return {
  "williamboman/mason.nvim",
  keys = {
    { "<leader>cm", false },
  },
  opts = {
    ensure_installed = {
      "prettier",
      "pyright",
      "autopep8",
      "clangd",
    },
  },
}
