local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/cartograph.nvim',
    name = 'cartograph-nvim',
    dir = dev.path 'Tools/nvim/cartograph.nvim',
    cmd = {
      'Cartograph',
      'CartographFromCursor',
      'CartographRepo',
      'CartographEndpoint',
      'CartographCompare',
      'CartographSave',
      'CartographLoad',
      'CartographMaps',
      'CartographClose',
    },
    keys = {},
    keymaps = {
      from_cursor = '<leader>cm',
      compare = '<leader>cc',
    },
    opts = {},
    config = function(_, opts) require('cartograph').setup(opts) end,
  },
}
