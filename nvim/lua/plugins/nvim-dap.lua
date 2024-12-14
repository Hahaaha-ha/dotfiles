return {
  "mfussenegger/nvim-dap",
  config = function()
    vim.keymap.set("n", "<Leader>b", require("dap").toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>bc", require("dap").continue, {})
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
