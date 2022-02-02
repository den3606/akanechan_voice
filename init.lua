dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

print("akanechan_voice load")

function OnPlayerSpawned(player_entity_id)
  local loaded = getInternalVariableValue(player_entity_id, "akanechan_voice.loaded?", "value_bool") or false
  if not loaded then
    EntityLoadToEntity("mods/akanechan_voice/files/entities/extend_player_voices.xml", player_entity_id)
    addNewInternalVariable(player_entity_id, "akanechan_voice.loaded?", "value_bool", true)
  end
end

ModRegisterAudioEventMappings("mods/akanechan_voice/files/audio/GUIDs.txt")

print("akanechan_voice loaded")
