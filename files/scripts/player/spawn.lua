dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

--------------
-- main
--------------
local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
SoundPlayer:registerSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/start_voice.xml")
