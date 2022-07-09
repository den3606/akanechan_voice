dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

function throw_item(from_x, from_y, to_x, to_y)
  print("throw item")
  local player_pos_x, player_pos_y = EntityGetTransform(getPlayerEntity())
  local r = math.floor(calcRadius(player_pos_x, player_pos_y, from_x, from_y) + 0.5)
  if r <= 9 then
    SetTimeOut(0.1, "mods/akanechan_voice/files/scripts/player/throw_item.lua", "throwing_item")
  end
end

function throwing_item()
  p("throwing item")
  local player_entity_id = getPlayerEntity()
  local is_picked_wand = getInternalVariableValue(player_entity_id, AKANECHAN:IS_PICKED_WAND(), "value_bool") or false
  local is_threw_wand = getInternalVariableValue(player_entity_id, AKANECHAN:IS_PICKED_WAND(), "value_bool") or false
  
  p("is_picked_wand: " .. tostring(is_picked_wand))
  if is_picked_wand then
    if WaitFrame:canCall(player_entity_id, AKANECHAN:PICKED_WAND()) then
      GameEntityPlaySound(player_entity_id, "player/throw/something")
    end
    setInternalVariableValue(player_entity_id, AKANECHAN:IS_PICKED_WAND(), "value_bool", false)
  elseif is_threw_wand then
    setInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool", false)
  else
    GameEntityPlaySound(player_entity_id, "player/throw/something")
  end
end
