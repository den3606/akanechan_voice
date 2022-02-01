dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")


--------------
-- main
--------------
local player_entity_id = getPlayerEntity()
GameEntityPlaySound( player_entity_id, "spawn" )
