dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function throw_item(from_x, from_y, to_x, to_y)
  local player_entity_id = getPlayerEntity()
  local player_pos_x, player_pos_y = EntityGetTransform(player_entity_id)
  local r = math.floor(calcRadius(player_pos_x, player_pos_y, from_x, from_y) + 0.5)
  if r <= 9  then
    local akanechan_voice = SoundPlayer:seachSoundPlayer(player_entity_id, AKANECHAN.SOUND_PLAYER_NAME)
    SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/throw/emerald_tablet_voice.xml")
  end
end
