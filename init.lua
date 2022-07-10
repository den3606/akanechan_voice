dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

print("akanechan_voice load")

function OnPlayerSpawned(player_entity_id)
  local loaded = getInternalVariableValue(player_entity_id, "akanechan_voice.loaded?", "value_bool") or false
  if not loaded then
    local player_entity_id = getPlayerEntity()
    AkanechanVoice = SoundPlayer:create(player_entity_id, AKANECHAN.SOUND_PLAYER_NAME, AKANECHAN:SOUND_FILE_STORAGE_NAME())

    -- spawn時にアクションを行いたいため、xml拡張ではなくentityに対しての代入となっている
    EntityLoadToEntity("mods/akanechan_voice/files/entities/extend_player_voices.xml", player_entity_id)
    addNewInternalVariable(player_entity_id, "akanechan_voice.loaded?", "value_bool", true)
  end
end

function OnWorldPreUpdate()
  if AkanechanVoice ~= nil then
    SoundPlayer:playSound(AkanechanVoice)
  end
end


-- 音声ファイルロード
dofile_once("mods/akanechan_voice/files/scripts/load_extends_voice.lua")

print("akanechan_voice loaded")
