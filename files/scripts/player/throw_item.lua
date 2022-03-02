dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function throw_item(from_x, from_y, to_x, to_y)
  print("throw item")
  local player_pos_x, player_pos_y = EntityGetTransform(getPlayerEntity())
  local r = math.floor(calcRadius(player_pos_x, player_pos_y, from_x, from_y) + 0.5)
  if r <= 9  then
    GameEntityPlaySound(getPlayerEntity(), "player/throw/something")
  end
end
