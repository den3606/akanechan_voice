dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function throw_item(from_x, from_y, to_x, to_y)
  p("throw item")
  local player_pos_x, player_pos_y = EntityGetTransform(GetPlayerEntity())
  local r = math.floor(calcRadius(player_pos_x, player_pos_y, from_x, from_y) + 0.5)
  if r <= 9 then
    SetTimeOut(0.15, "mods/akanechan_voice/files/scripts/player/throw_item.lua", "throwing_item")
  end
end

function throwing_item()
  local player_entity_id = GetPlayerEntity()
  local akanechan_voice = SoundPlayer:seachSoundPlayer(player_entity_id, AKANECHAN.SOUND_PLAYER_NAME)
  SoundPlayer:registerOnlyEmptySoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/throw/item_voice.xml")
end
