return {
  {
    'Symphon-y/gitdiff.nvim',
    name = 'gitdiff-nvim',
    dev = vim.fn.isdirectory(vim.fn.expand '~/Projects/gitdiff-nvim/') == 1,
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
