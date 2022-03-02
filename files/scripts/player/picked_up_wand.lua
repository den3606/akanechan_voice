dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
local function playPlayerPickupSound(player_entity_id)
  GameEntityPlaySound(player_entity_id, "player/pickup/wand")
end

local function playEnemyPickupSound(player_entity_id)
  GameEntityPlaySound(player_entity_id, "enemy/pickup/wand")
end

--------------
-- main
--------------
function item_pickup(item_entity_id, pickupper_entity_id, item_name)
  print("pickup wand")
  local player_entity_id = getPlayerEntity()


  local is_swapped_wand = getInternalVariableValue(player_entity_id, AKANECHAN:IS_THROWED_WAND(), "value_bool")
  print("is_swapped_wand: " .. tostring(is_swapped_wand))
  if is_swapped_wand then return end

  if player_entity_id == pickupper_entity_id then
    WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_WAND(), function()
      playPlayerPickupSound(player_entity_id)
    end, 600)
  else
    WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_WAND(), function()
      playEnemyPickupSound(player_entity_id)
    end, 600)
  end

end
