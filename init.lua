dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

print("akanechan_voice load")

function OnPlayerSpawned(player_entity_id)
  local loaded = (tonumber(GlobalsGetValue("akanechan_voice.loaded?", "0")) == 1)
  if not loaded then
    EntityLoadToEntity("mods/akanechan_voice/files/entities/extend_player_voices.xml", player_entity_id)
    GlobalsSetValue("akanechan_voice.loaded?", "1")
  end
end

ModRegisterAudioEventMappings("mods/akanechan_voice/files/audio/GUIDs.txt")

print("akanechan_voice loaded")
