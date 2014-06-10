-- This function returns a formatted string with the current battery status. It
-- can be used to populate a text widget in the awesome window manager. Based
-- on the "Gigamo Battery Widget" found in the wiki at awesome.naquadah.org,

function batteryInfo(adapter)
  local fcur = io.open("/sys/class/power_supply/"..adapter.."/energy_now")
  local fcap = io.open("/sys/class/power_supply/"..adapter.."/energy_full")
  local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")

  local ret
  if not (fcur and fcap and fsta) then
    ret =" ☒ "
  else
    local cur = fcur:read()
    local cap = fcap:read()
    local sta = fsta:read()
    local battery = math.floor(cur * 100 / cap)

    if sta:match("Discharging") then
      ret = " " .. battery .. "% "
    elseif sta:match("Charging") then
      ret = " ⚡" .. battery .. "% "
    else
        ret = ""
    end
  end

  if cur then fcur:close() end
  if cap then fcap:close() end
  if sta then fsta:close() end

  return ret
end
