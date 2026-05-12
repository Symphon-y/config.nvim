-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'Symphon-y/courier.nvim',
    name = 'courier-nvim',
    -- Use the local working copy when ~/Projects/courier-nvim exists (dev
    -- machine); otherwise lazy.nvim clones from GitHub on a fresh setup.
    dev = vim.fn.isdirectory(vim.fn.expand '~/Projects/courier-nvim') == 1,
    cmd = {
      'CourierStart',
      'CourierClose',
    },
    keys = {},
    opts = {
      sidebar_width = 30,
      request_height_ratio = 0.55,
      history_limit = 20,
      curl_timeout = 30,
    },
    config = function(_, opts) require('courier').setup(opts) end,
  },
}
