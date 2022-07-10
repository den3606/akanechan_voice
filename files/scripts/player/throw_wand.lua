dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
local player_entity_id = getPlayerEntity()

function throw_item(from_x, from_y, to_x, to_y)
  local akanechan_voice = SoundPlayer:seachSoundPlayer(getPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
  SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/throw/wand_voice.xml")
end
