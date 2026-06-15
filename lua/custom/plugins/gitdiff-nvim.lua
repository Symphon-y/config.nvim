local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/gitdiff.nvim',
    name = 'gitdiff-nvim',
    dir = dev.path 'gitdiff-nvim',
    cmd = {
      'GitDiffStart',
      'GitDiffStop',
      'GitDiffClose',
    },
    keys = {},
    opts = {},
    config = function(_, opts) require('gitdiff-nvim').setup(opts) end,
  },
}
