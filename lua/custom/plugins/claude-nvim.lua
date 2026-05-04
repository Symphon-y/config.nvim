return {
  {
    'Symphon-y/claude-nvim',
    -- Use the local working copy when ~/Projects/claude-nvim exists (dev
    -- machine); otherwise lazy.nvim clones from GitHub on a fresh setup.
    dev = vim.fn.isdirectory(vim.fn.expand('~/Projects/claude-nvim')) == 1,
    cmd = {
      'ClaudeStart', 'ClaudeStop', 'ClaudeToggle', 'ClaudeStatus',
      'ClaudeReload', 'ClaudeLog', 'ClaudeLogClear',
    },
    keys = {
      { '<leader>cc', '<cmd>ClaudeToggle<cr>', desc = '[C]laude [C]ode toggle' },
    },
    opts = {},
    config = function(_, opts) require('claude-nvim').setup(opts) end,
  },
}
