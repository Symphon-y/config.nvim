return {
  {
    'Symphon-y/claude.nvim',
    name = 'claude-nvim',
    -- Use the local working copy when ~/Projects/claude-nvim exists (dev
    -- machine); otherwise lazy.nvim clones from GitHub on a fresh setup.
    dev = vim.fn.isdirectory(vim.fn.expand('~/Projects/claude-nvim')) == 1,
    cmd = {
      'ClaudeStart', 'ClaudeStop', 'ClaudeToggle', 'ClaudeStatus',
      'ClaudeReload', 'ClaudeLog', 'ClaudeLogClear',
      'ClaudeSuggest', 'ClaudeSuggestAccept', 'ClaudeSuggestDismiss',
    },
    keys = {
      { '<leader>cc', '<cmd>ClaudeToggle<cr>',  desc = '[C]laude [C]ode toggle' },
      { '<leader>cs', '<cmd>ClaudeSuggest<cr>', desc = '[C]laude [S]uggest at cursor' },
    },
    opts = {},
    config = function(_, opts) require('claude-nvim').setup(opts) end,
  },
}
