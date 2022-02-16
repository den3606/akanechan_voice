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
  local player_entity_id = getPlayerEntity()
  if player_entity_id == pickupper_entity_id then
    WaitFrame:tryCall(player_entity_id, GLOBAL_PREFIXES:item_pickup(), function()
      playPlayerPickupSound(player_entity_id)
    end, 600)
  else
    WaitFrame:tryCall(player_entity_id, GLOBAL_PREFIXES:item_pickup(), function()
      playEnemyPickupSound(player_entity_id)
    end, 600)
  end

end
