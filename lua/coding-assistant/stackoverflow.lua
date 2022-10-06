local api = vim.api
local M = {}
math.randomseed(os.time())

local function randString(length)
  local rstr = {}
  for _ = 1, length do
    local randLower = string.char(math.random(97, 97 + 25))
    local randUpper = string.char(math.random(65, 65 + 25))
    table.insert(rstr, randLower .. randUpper)
  end
  return table.concat(rstr)
end

local function isEmpty(input)
  return not input or input == ""
end

function M.run_cmd_with_terminal(cmd)
  local termFmt = "FloatermNew --title=%s --wintype=float --autoclose=1 --name=%s %s"
  local termCmd = string.format(termFmt, randString(8), randString(9), cmd)
  api.nvim_command(termCmd)
end

function M.so_search()
  vim.ui.input({ prompt = "Search stackoverflow" }, function(input)
    if isEmpty(input) then
      return
    end
    M.run_cmd_with_terminal("so" .. " -e google " .. input)
  end)
end

return M
