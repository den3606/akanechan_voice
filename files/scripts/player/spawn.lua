dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

--------------
-- main
--------------
local akanechan_voice = SoundPlayer:seachSoundPlayer(getPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
SoundPlayer:registerSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/start_voice.xml")
