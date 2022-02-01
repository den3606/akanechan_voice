dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")


--------------
-- main
--------------
local player_entity_id = getPlayerEntity()
local pos_x, pos_y = EntityGetTransform(player_entity_id)
print("debug")
-- GamePlaySound("mods/akanechan_voice/files/audio/mod_voices.bank", "akanechan/spawn", pos_x, pos_y)
-- GamePlaySound("mods/akanechan_voice/files/audio/my_mod_audio.bank", "snd_mod/create-test", pos_x, pos_y)
GamePlaySound("mods/akanechan_voice/files/audio/my_mod_audio.bank", "snd_mod/take_small_damage", pos_x, pos_y)
