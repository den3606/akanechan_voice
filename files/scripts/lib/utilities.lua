function p(message)
  print(tostring(message))
end

function split(str, sep)
  if sep == nil then
    return {}
  end

  local t = {}

  local i = 1
  for s in string.gmatch(str, "([^" .. sep .. "]+)") do
    t[i] = s
    i = i + 1
  end

  return t
end

dofile_once("mods/akanechan_voice/files/scripts/lib/utils/global_values.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/utils/variable_storage.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/utils/player.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/utils/calculate.lua")

-- has dependent
dofile_once("mods/akanechan_voice/files/scripts/lib/utils/wait_frame.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/utils/sound_player.lua")
