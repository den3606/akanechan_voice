dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
print("akanechan_voice load")

local registered_entity_id = nil
local is_player_dead = false

function OnModInit()
  -- 音声ファイルロード
  dofile("mods/akanechan_voice/files/scripts/load_extends_voice.lua")
end

function OnPlayerSpawned(player_entity_id)
  registered_entity_id = player_entity_id
  is_player_dead = false

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
  if is_player_dead then
    return
  end

  local current_player_entity = getPlayerEntity()
  local is_transformed_player = current_player_entity ~= registered_entity_id and current_player_entity ~= nil
  ReregisterSoundPlayer(is_transformed_player, current_player_entity)

  if is_transformed_player and FindSheepPlayer() then
    dofile('mods/akanechan_voice/files/scripts/player/sheep.lua')
  end

  if AkanechanVoice ~= nil then
    SoundPlayer:playSound(AkanechanVoice)
  end

end

function OnPlayerDied()
  is_player_dead = true
end

function ReregisterSoundPlayer(is_transformed_player, current_player_entity)
  if is_transformed_player then
    SoundPlayer:destroySoundPlayer(current_player_entity, AKANECHAN.SOUND_PLAYER_NAME)
    SoundPlayer:destroySoundPlayer(registered_entity_id, AKANECHAN.SOUND_PLAYER_NAME)
    AkanechanVoice = SoundPlayer:create(current_player_entity, AKANECHAN.SOUND_PLAYER_NAME, AKANECHAN:SOUND_FILE_STORAGE_NAME())
    registered_entity_id = getPlayerEntity()
  end
end

print("akanechan_voice loaded")
