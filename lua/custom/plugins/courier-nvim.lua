-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
local dev = require 'custom.local_dev'
return {
  {
    'Symphon-y/courier.nvim',
    name = 'courier-nvim',
    dir = dev.path 'courier-nvim',
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
