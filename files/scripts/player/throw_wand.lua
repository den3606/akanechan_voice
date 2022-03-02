dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
local player_entity_id = getPlayerEntity()

function throw_item(from_x, from_y, to_x, to_y)
  if getInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool") == nil then
    addNewInternalVariable(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool", true)
  else
    setInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool", true)
  end

  SetTimeOut(1, "mods/akanechan_voice/files/scripts/player/throw_wand.lua", "endOfThrowingTime")
end

function endOfThrowingTime()
  setInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool", false)
end
