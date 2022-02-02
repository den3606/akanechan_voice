dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/global_prefixes.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/wait_frame.lua")

function kick(entity_who_kicked)
  GameEntityPlaySound( getPlayerEntity(), "player/kick" )
end
