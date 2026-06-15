---@module 'lazy'
---@type LazySpec
local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/preview.nvim',
    name = 'preview-nvim',
    dir = dev.path 'preview-nvim',
    cmd = {
      'PreviewStart',
      'PreviewClose',
    },
    keys = {},
    opts = {},
    config = function(_, opts) require('preview-md').setup(opts) end,
  },
}
