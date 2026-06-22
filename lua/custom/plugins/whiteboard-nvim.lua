local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/whiteboard.nvim',
    name = 'whiteboard-nvim',
    dir = dev.path 'Tools/nvim/whiteboard.nvim',
    build = 'cd server && npm install',
    config = function(_, opts) require('whiteboard-nvim').setup(opts) end,
  },
}
