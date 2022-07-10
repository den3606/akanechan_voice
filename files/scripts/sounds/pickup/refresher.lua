dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function audio_event_dead(bank_file, event_root)
  SoundPlayer:deleteSoundEntity(GetUpdatedEntityID())
end

--------------
-- main
--------------
GameEntityPlaySound(GetUpdatedEntityID(), "player/pickup/refresher")
