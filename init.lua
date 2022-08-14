dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

print("akanechan_voice load")

function OnModInit()
  -- 音声ファイルロード
  dofile("mods/akanechan_voice/files/scripts/load_extends_voice.lua")
end

function OnPlayerSpawned(player_entity_id)
  local player_entity_id = getPlayerEntity()

  SoundPlayer:destroySoundPlayer(player_entity_id, AKANECHAN.SOUND_PLAYER_NAME)
  AkanechanVoice = SoundPlayer:create(player_entity_id, AKANECHAN.SOUND_PLAYER_NAME, AKANECHAN:SOUND_FILE_STORAGE_NAME())

  local loaded = getInternalVariableValue(player_entity_id, "akanechan_voice.loaded?", "value_bool") or false
  if not loaded then
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

print("akanechan_voice loaded")
