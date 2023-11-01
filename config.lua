-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Theme
lvim.colorscheme = "nightfly"

-- Languages
lvim.builtin.treesitter.ensure_installed = {
  "python",
  "go",
  "java",
  "rust",
  "c"
  }

-- Additional Plugins
lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"bluz71/vim-nightfly-colors"},
  {"catppuccin/nvim"},
  {"zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter",},
  {"zbirenbaum/copilot-cmp", after = { "copilot.lua" },
  config = function()
    require("copilot_cmp").setup()
  end,
  },
  }

-- Setting Copilot
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
