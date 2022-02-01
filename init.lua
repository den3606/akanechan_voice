dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

print("akanechan_voice load")

function OnWorldInitialized()
  local player_entity_id = getPlayerEntity()
  print(player_entity_id)
  print("world init")
  EntityLoadToEntity( "mods/akanechan_voice/files/entities/extend_player_voices.xml", player_entity_id )
end

ModRegisterAudioEventMappings("mods/akanechan_voice/files/audio/GUIDs.txt")

print("akanechan_voice loaded")
