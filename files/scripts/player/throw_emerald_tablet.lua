dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/global_prefixes.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/wait_frame.lua")

function throw_item(from_x, from_y, to_x, to_y)
  local player_pos_x, player_pos_y = EntityGetTransform(getPlayerEntity())
  local r = math.floor(calcRadius(player_pos_x, player_pos_y, from_x, from_y) + 0.5)
  if r <= 9  then
    GameEntityPlaySound(getPlayerEntity(), "player/throw/emerald_tablet")
  end
end
