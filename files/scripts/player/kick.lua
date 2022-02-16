dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function kick(entity_who_kicked)
  GameEntityPlaySound( getPlayerEntity(), "player/kick" )
end
