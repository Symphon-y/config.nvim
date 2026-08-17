local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/signet.nvim',
    name = 'signet-nvim',
    dir = dev.path 'Tools/nvim/signet.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'signet'
    end,
  },
}
