dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

--------------
-- main
--------------
p('neutralized_voice')
local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/neutralized_voice.xml")