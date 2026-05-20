return {
  {
    'Symphon-y/gitdiff.nvim',
    name = 'gitdiff-nvim',
    -- Use the local working copy when ~/Projects/claude-nvim exists (dev
    -- machine); otherwise lazy.nvim clones from GitHub on a fresh setup.
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
