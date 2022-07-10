dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

--------------
-- main
--------------
function item_pickup(item_entity_id, pickupper_entity_id, item_name)
  local akanechan_voice = SoundPlayer:seachSoundPlayer(getPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
  SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/pickup/temple_health.xml")
end
