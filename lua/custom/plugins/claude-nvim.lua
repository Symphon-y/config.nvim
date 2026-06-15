local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/claude.nvim',
    name = 'claude-nvim',
    dir = dev.path 'claude-nvim',
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
