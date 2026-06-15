local M = {}
local base = vim.fn.expand(vim.env.NVIM_PROJECTS_DIR or '~/Projects')

function M.path(relative)
  local full = base .. '/' .. relative
  return vim.fn.isdirectory(full) == 1 and full or nil
end

return M
