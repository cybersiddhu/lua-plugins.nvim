local api = vim.api
local optM = require("coding-assistant.cmd-options")
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

local M = {}
function M.run_cmd_with_terminal(cmd)
  local termFmt = "FloatermNew --title=%s --wintype=float --autoclose=1 --name=%s %s"
  local termCmd = string.format(termFmt, randString(8), randString(9), cmd)
  api.nvim_command(termCmd)
end

function M.so_search(opts)
  vim.ui.input({ prompt = "Search stackoverflow" }, function(input)
    if isEmpty(input) then
      return
    end
    optM.init_default_values()
    if opts then
      if opts.engine then
        optM.set_engine(opts.engine)
      end
      if opts.limit then
        optM.set_limit(opts.limit)
      end
    end
    local cmd = string.format("-e %s -l %d %s", optM.engine(), optM.limit(), input)
    M.run_cmd_with_terminal(cmd)
  end)
end

return M
