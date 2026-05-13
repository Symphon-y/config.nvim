---@module 'lazy'
---@type LazySpec
return {
  {
    'Symphon-y/preview.nvim',
    name = 'preview-nvim',
    -- Use the local working copy when ~/Projects/preview-nvim exists (dev
    -- machine); otherwise lazy.nvim clones from GitHub on a fresh setup.
    dev = vim.fn.isdirectory(vim.fn.expand '~/Projects/preview-nvim') == 1,
    cmd = {
      'PreviewStart',
      'PreviewClose',
    },
    keys = {},
    opts = {},
    config = function(_, opts) require('preview-md').setup(opts) end,
  },
}
