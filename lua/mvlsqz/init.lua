local M = {}

M.colorscheme_flavour = function()
  local hr = tonumber(os.date("%H", os.time()))
  local flavour

  if hr > 9 and hr < 17 then
    flavour = "latte"
  else
    flavour = "mocha"
  end
  return flavour
end
return M
