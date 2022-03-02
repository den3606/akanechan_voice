dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function throw_item(from_x, from_y, to_x, to_y)
  local player_entity_id = getPlayerEntity()

  setInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool", true)

  WaitFrame:tryCall(player_entity_id, AKANECHAN:THROWED_WAND(), function()
    setInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool", false)
  end, 60)
end
